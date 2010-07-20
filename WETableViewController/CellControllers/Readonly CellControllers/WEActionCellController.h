#import <UIKit/UIKit.h>
#import "WECellController.h"

@interface WEActionCellController : NSObject <WECellController>
{
	id _observer;
	SEL _selector;
	UILabel *_label;
	UITableViewCell *_cell;
	
}

- (id)initWithLabel:(NSString *)newLabel Observer:(id) observer Selector:(SEL) selector;

@property (nonatomic, readonly) UILabel *label;
@end
