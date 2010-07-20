
#import <Foundation/Foundation.h>

@interface Address : NSObject <NSCoding, NSCopying> {
	NSString *_country;
	NSString *_city;
	NSString *_street;
	NSString *_houseNumber;
}

+ (id) address;

@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *street;
@property (nonatomic, copy) NSString *houseNumber;

@end
