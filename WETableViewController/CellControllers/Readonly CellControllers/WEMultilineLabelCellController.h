#import <Foundation/Foundation.h>

@interface WEMultilineLabelCellController : NSObject {
@private
	NSString *_description;
	float _margin;
	float _labelFontSize;
}

@property (nonatomic, readonly) NSString *description;
- (id) initWithText:(NSString*) description;
@end
