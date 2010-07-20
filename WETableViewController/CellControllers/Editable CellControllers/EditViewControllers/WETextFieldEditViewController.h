#import <UIKit/UIKit.h>
#import "WEEditViewController.h"
@interface WETextFieldEditViewController : WEEditViewController <UITextFieldDelegate> {
	UITableViewCell *_cell;
	UITextField *_textField;
}

@end
