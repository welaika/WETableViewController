//
//  Address.m
//  iSindone
//
//  Created by Stefano Verna on 11/03/10.
//  Copyright 2010 WeLaika. All rights reserved.
//

#import "Address.h"


@implementation Address
@synthesize country = _country;
@synthesize city = _city;
@synthesize street = _street;
@synthesize houseNumber = _houseNumber;

+ (id) address
{
	return [[[Address alloc] init] autorelease];
}

- (id)initWithCoder:(NSCoder *)decoder {
	self = [super init];
	if (self != nil) {
		_country = [[decoder decodeObjectForKey:@"country"] retain];
		_city = [[decoder decodeObjectForKey:@"city"] retain];
		_street = [[decoder decodeObjectForKey:@"street"] retain];
		_houseNumber = [[decoder decodeObjectForKey:@"houseNumber"] retain];
	}
	return self;
}

- (id)copyWithZone:(NSZone *)zone
{
	Address *newAddress = [[Address alloc] init];
	newAddress.country = _country;
	newAddress.city = _city;
	newAddress.street = _street;
	newAddress.houseNumber = _houseNumber;
	
	return newAddress;
}

- (BOOL) isEqual: (id)anObject
{
	if (![anObject isKindOfClass:[Address class]]) {
		return NO;
	}
	
	Address *a = (Address*) anObject;
	
	return 
		[_country isEqualToString: a.country] && 
		[_city isEqualToString: a.city] &&
		[_street isEqualToString: a.street] &&
		[_houseNumber isEqualToString: a.houseNumber];
}

- (void)encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject:_city forKey:@"city"];
	[encoder encodeObject:_country forKey:@"country"];
	[encoder encodeObject:_street forKey:@"street"];
	[encoder encodeObject:_houseNumber forKey:@"houseNumber"];
}

- (void) dealloc
{
	
	[_country release];
	[_city release];
	[_street release];
	[_houseNumber release];
	[super dealloc];
}


- (NSString*) description
{
	NSMutableArray *strings = [NSMutableArray array];
	if (_street) {
		NSMutableString *string = [NSMutableString string];
		[string appendString:_street];
		if (_houseNumber) {
			[string appendFormat:@", %@", _houseNumber];
		}
		[strings addObject:string];
	}
	if (_city) {
		NSMutableString *string = [NSMutableString string];
		[string appendString:_city];
		if (_country) {
			[string appendFormat:@" - %@", _country];
		}
		[strings addObject:string];	
	}
	return [strings componentsJoinedByString:@"\n"];
}

@end