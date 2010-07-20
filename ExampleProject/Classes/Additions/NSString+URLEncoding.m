#import "NSString+URLEncoding.h"

@implementation NSString(URLEncoding) 
- (NSString*) telephoneNumber
{
	NSMutableString *temp = [[self mutableCopy] autorelease];
	[temp replaceOccurrencesOfString:@" "
						  withString:@"-"
							 options:NSLiteralSearch
							   range:NSMakeRange(0, [temp length])];
	
	if ([temp rangeOfString:@"+"].location != 0) {
		[temp insertString:@"+39-" atIndex:0];
	}
	
	return [NSString stringWithString: temp];
}

- (NSString*) urlEncoded
{
	NSMutableString *temp = [[self mutableCopy] autorelease];
	[temp replaceOccurrencesOfString:@"\n"
						  withString:@", "
							 options:NSLiteralSearch
							   range:NSMakeRange(0, [temp length])];
	[temp replaceOccurrencesOfString:@" "
						  withString:@"+"
							 options:NSLiteralSearch
							   range:NSMakeRange(0, [temp length])];	
	
	return [NSString stringWithString: temp];
}

+ (NSString*) stringWithDistance: (float) distance
{
    if (distance < 100)
		return [NSString stringWithFormat:@"%gm", roundf(distance)];
    else if (distance < 1000)
		return [NSString stringWithFormat:@"%gm", roundf(distance/5)*5];
    else if (distance < 10000)
		return [NSString stringWithFormat:@"%gkm", roundf(distance/100)/10];
    else
		return [NSString stringWithFormat:@"%gkm", roundf(distance/1000)];
}


@end
