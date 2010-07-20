//
//  ContactInformation.m
//  iSindone
//
//  Created by Stefano Verna on 22/02/10.
//  Copyright 2010 WeLaika. All rights reserved.
//

#import "NSString+URLEncoding.h"
#import "ContactInformation.h"

@implementation ContactInformation
@synthesize title = _title;
@synthesize value = _value;
@synthesize type = _type;

+ (id) contactWithType:(ContactType) type title:(NSString*) title value:(NSString*) value
{
	return [[[ContactInformation alloc] initWithType:type title:title value:value] autorelease];
}

- (id) initWithType:(ContactType) type title:(NSString*) title value:(NSString*) value
{
	self = [super init];
	if (self != nil) {
		_type = type;
		_title = [title retain];
		_value = [value retain];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
	self = [super init];
	if (self != nil) {
		_type = [[decoder decodeObjectForKey:@"type"] intValue];
		_title = [[decoder decodeObjectForKey:@"title"] retain];
		_value = [[decoder decodeObjectForKey:@"value"] retain];
	}
	return self;
}

- (id)copyWithZone:(NSZone *)zone
{
	ContactInformation *contact = [[ContactInformation alloc] init];
	contact.title = _title;
	contact.value = _value;
	contact.type = _type;
	
	return contact;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject:[NSNumber numberWithInt:_type] forKey:@"type"];
	[encoder encodeObject:_title forKey:@"title"];
	[encoder encodeObject:_value forKey:@"value"];
}

- (bool) is:(ContactType) type
{
	return _type == type;
}
- (void) performAction
{
	NSString* url = Nil;
	
	if (_type == ContactTypeWebsite) 
		url = _value;
	else if (_type == ContactTypePhoneNumber)
		url = [NSString stringWithFormat:@"tel:%@", [_value telephoneNumber]];
	else if (_type == ContactTypeEmail)
		url = [NSString stringWithFormat:@"mailto:%@", _value];
	else if (_type == ContactTypeMap) {
		url = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", [_value urlEncoded]]; 
	}
	if (url) {
		url = (NSString *)CFURLCreateStringByAddingPercentEscapes( NULL,
			(CFStringRef)url,
			(CFStringRef)@":/&=",
			(CFStringRef)@"",
			kCFStringEncodingUTF8 
		);
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString: url]];
	}
}

@end
