
#import "WEAddressCellController.h"
#import "WEAddressEditViewController.h"

@implementation WEAddressCellController

- (id) initWithParentViewController:(WETableViewController*) viewController
{
	self = [super initWithParentViewController:viewController];
	if (self != nil) {
		_valueController = [[WEAddressEditViewController alloc] initWithCellController:self];
	}
	return self;
}
@end
