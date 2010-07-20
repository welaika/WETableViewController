#import "WETextViewCellController.h"
#import "WETextViewEditViewController.h"
@implementation WETextViewCellController
- (id) initWithParentViewController:(WETableViewController*) viewController
{
	self = [super initWithParentViewController:viewController];
	if (self != nil) {
		_valueController = [[WETextViewEditViewController alloc] initWithCellController:self];
	}
	return self;
}

@end
