//
//  WEGenericDatePickerEditViewController.h
//  iSindone
//
//  Created by Stefano Verna on 28/02/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "WEGenericEditViewController.h"
@interface WEGenericDatePickerEditViewController : WEGenericEditViewController {
	UITableViewCell *cell;
	UILabel *label;
	UIDatePicker *datePicker;
}

- (NSString*) valueStringRepresentationFor:(id) value;
@property (nonatomic, readonly) UIDatePicker *datePicker;
@end
