//
//  WEDatePickerCellController.h
//  iSindone
//
//  Created by Stefano Verna on 28/02/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "WEEditableCaptionedCellController.h"
@interface WEDatePickerCellController : WEEditableCaptionedCellController {
@private
	UIDatePickerMode _pickerMode;
}

@property (nonatomic, assign) UIDatePickerMode pickerMode;
@end
