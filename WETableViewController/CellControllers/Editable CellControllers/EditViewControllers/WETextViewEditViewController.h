//
//  WETextViewEditViewController.h
//  iSindone
//
//  Created by Stefano Verna on 01/03/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "WEEditViewController.h"
@interface WETextViewEditViewController : WEEditViewController {
@private
	UITableViewCell *_cell;
	UITextView *_textView;
}

@end
