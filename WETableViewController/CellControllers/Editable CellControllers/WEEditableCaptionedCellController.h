#import <Foundation/Foundation.h>
#import "WECaptionedCellController.h"
#import "WEEditViewController.h"
#import "WETableViewController.h"

@interface WEEditableCaptionedCellController : WECaptionedCellController {
@protected
	WEEditViewController *_valueController;
	WETableViewController *_parentViewController;
}

- (id) initWithParentViewController:(WETableViewController*) viewController;

@property (nonatomic, retain) WETableViewController *parentViewController;

@end
