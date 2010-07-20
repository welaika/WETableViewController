#import "WEOptionsCellController.h"
#import "WEOptionsEditViewController.h"
@implementation WEOptionsCellController
- (id) initWithParentViewController:(WETableViewController*) viewController
{
	self = [super initWithParentViewController:viewController];
	if (self != nil) {
		_valueController = [[WEOptionsEditViewController alloc] initWithCellController:self];
	}
	return self;
}

- (NSDictionary*) options
{
	return [(WEOptionsEditViewController*) _valueController options];
}

- (void) setOptions: (NSDictionary*) options
{
	[(WEOptionsEditViewController*) _valueController setOptions: options];
}

@end
