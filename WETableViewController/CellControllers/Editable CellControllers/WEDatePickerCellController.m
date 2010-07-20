//
//  WEDatePickerCellController.m
//  iSindone
//
//  Created by Stefano Verna on 28/02/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import "WEDatePickerCellController.h"
#import "WEDatePickerEditViewController.h"
@implementation WEDatePickerCellController
@synthesize pickerMode = _pickerMode;
- (id) initWithParentViewController:(WETableViewController*) viewController
{
	self = [super initWithParentViewController:viewController];
	if (self != nil) {
		_valueController = [[WEDatePickerEditViewController alloc] initWithCellController:self];
	}
	return self;
}

- (void) setPickerMode:(UIDatePickerMode) mode
{
	WEDatePickerEditViewController* controller = (WEDatePickerEditViewController*) _valueController;
	controller.datePicker.datePickerMode = mode;
}

@end
