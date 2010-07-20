//
//  WEDatePickerCellController.m
//  iSindone
//
//  Created by Stefano Verna on 28/02/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import "WEDatePickerCellController.h"
#import "WEGenericDatePickerEditViewController.h"
@implementation WEDatePickerCellController
@synthesize pickerMode = _pickerMode;
- (id) initWithParentViewController:(WEGenericTableViewController*) viewController
{
	self = [super initWithParentViewController:viewController];
	if (self != nil) {
		_valueController = [[WEGenericDatePickerEditViewController alloc] initWithCellController:self];
	}
	return self;
}

- (void) setPickerMode:(UIDatePickerMode) mode
{
	WEGenericDatePickerEditViewController* controller = (WEGenericDatePickerEditViewController*) _valueController;
	controller.datePicker.datePickerMode = mode;
}

@end
