
#import <Foundation/Foundation.h>
#import "WETableViewController.h"
#import "WETextFieldCellController.h"
#import "WETextViewCellController.h"
#import "WEOptionsCellController.h"
#import "WEDatePickerCellController.h"

@interface EditFormExampleTableViewController : WETableViewController {
	WETextFieldCellController *_textFieldCellController;
	WETextViewCellController *_textViewCellController;
	WEOptionsCellController *_optionsCellController;
	WEDatePickerCellController *_datePickerCellController;
}

@end
