//
//  WEEditableCaptionedCellController.h
//  iSindone
//
//  Created by Stefano Verna on 26/02/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "WECaptionedCellController.h"
#import "WEEditViewController.h"
#import "WETableViewController.h"

@interface WEEditableCaptionedCellController : WECaptionedCellController {
@protected
	WEEditViewController *_valueController;
	WETableViewController *_parentViewController;
}

- (id) initWithParentViewController:(WETableViewController*) viewController;

@property (nonatomic, retain) WETableViewController *parentViewController;

@end
