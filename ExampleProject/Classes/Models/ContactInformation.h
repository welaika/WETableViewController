#import <Foundation/Foundation.h>

typedef enum {
	ContactTypeMap, 
	ContactTypeEmail, 
	ContactTypePhoneNumber,
	ContactTypeWebsite,
	ContactTypePerson
}
 ContactType;

@interface ContactInformation : NSObject <NSCoding, NSCopying> {
@private
	NSString *_title;
	NSString *_value;
	ContactType _type;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *value;
@property (nonatomic, assign) ContactType type;

+ (id) contactWithType:(ContactType) type title:(NSString*) title value:(NSString*) value;
- (id) initWithType:(ContactType) type title:(NSString*) title value:(NSString*) value;
- (bool) is:(ContactType) type;
- (void) performAction; 
@end
