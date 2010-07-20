#import <UIKit/UIKit.h>
@interface KeyboardDatePicker : UIViewController <UIPickerViewDelegate> {
@private
	UIDatePicker* _picker;
	UIBarButtonItem* _doneButton;
	UIBarButtonItem* _cancelButton;
	UIView* _backgroundView;
	id _observer;
	SEL _selector;
}

@property (readonly) UIDatePicker *picker;
- (void) addToViewWithAnimation:(UIView *) theView;
- (void) removeWithAnimation;
- (void) addDoneObserver:(id) observer Selector:(SEL) selector;
@end
