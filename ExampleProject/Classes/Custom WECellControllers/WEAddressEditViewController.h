
#import <Foundation/Foundation.h>
#import "WEEditViewController.h"

@interface WEAddressEditViewController : WEEditViewController <UITextFieldDelegate> {
	UITableViewCell *streetCell;
	UITextField *streetTextField;
	UITableViewCell *cityCell;
	UITextField *cityTextField;
	UITableViewCell *houseNumberCell;
	UITextField *houseNumberTextField;
	UITableViewCell *countryCell;
	UITextField *countryTextField;

}

@end
