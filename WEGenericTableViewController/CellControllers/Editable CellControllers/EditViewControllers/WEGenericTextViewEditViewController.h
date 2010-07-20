//
//  WEGenericTextViewEditViewController.h
//  iSindone
//
//  Created by Stefano Verna on 01/03/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "WEGenericEditViewController.h"
@interface WEGenericTextViewEditViewController : WEGenericEditViewController {
@private
	UITableViewCell *_cell;
	UITextView *_textView;
}

@end
