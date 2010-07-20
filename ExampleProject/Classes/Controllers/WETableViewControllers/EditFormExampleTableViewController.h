//
//  EditFormExampleTableViewController.h
//  ExampleProject
//
//  Created by Stefano Verna on 20/07/10.
//  Copyright 2010 Seac02 s.r.l. All rights reserved.
//

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
