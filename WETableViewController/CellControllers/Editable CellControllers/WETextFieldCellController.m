#import "WETextFieldCellController.h"
#import "WETextFieldEditViewController.h"
@implementation WETextFieldCellController
- (id) initWithParentViewController:(WETableViewController*) viewController
{
	self = [super initWithParentViewController:viewController];
	if (self != nil) {
		_valueController = [[WETextFieldEditViewController alloc] initWithCellController:self];
	}
	return self;
}

@end
