//
//  WETextFieldEditViewController.h
//  iSindone
//
//  Created by Stefano Verna on 26/02/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "WEEditViewController.h"
@interface WETextFieldEditViewController : WEEditViewController <UITextFieldDelegate> {
	UITableViewCell *_cell;
	UITextField *_textField;
}

@end
