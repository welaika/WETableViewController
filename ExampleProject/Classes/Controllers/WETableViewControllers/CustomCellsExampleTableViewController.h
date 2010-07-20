
#import <Foundation/Foundation.h>
#import "WETableViewController.h"
#import "WEAddressCellController.h"
#import "WEContactCellController.h"

@interface CustomCellsExampleTableViewController : WETableViewController {
@private
	WEAddressCellController *_addressCellController;
	WEContactCellController *_emailCellController;
	WEContactCellController *_websiteCellController;
	WEContactCellController *_phoneNumberCellController;
}

@end
