#import <Foundation/Foundation.h>
#import "WEEditViewController.h"
@interface WEDatePickerEditViewController : WEEditViewController {
	UITableViewCell *cell;
	UILabel *label;
	UIDatePicker *datePicker;
}

- (NSString*) valueStringRepresentationFor:(id) value;
@property (nonatomic, readonly) UIDatePicker *datePicker;
@end
