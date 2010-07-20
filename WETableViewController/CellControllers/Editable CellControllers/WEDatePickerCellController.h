#import <Foundation/Foundation.h>
#import "WEEditableCaptionedCellController.h"
@interface WEDatePickerCellController : WEEditableCaptionedCellController {
@private
	UIDatePickerMode _pickerMode;
}

@property (nonatomic, assign) UIDatePickerMode pickerMode;
@end
