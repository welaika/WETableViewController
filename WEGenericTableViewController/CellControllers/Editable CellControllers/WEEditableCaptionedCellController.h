//
//  WEEditableCaptionedCellController.h
//  iSindone
//
//  Created by Stefano Verna on 26/02/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "WECaptionedCellController.h"
#import "WEGenericEditViewController.h"
#import "WEGenericTableViewController.h"

@interface WEEditableCaptionedCellController : WECaptionedCellController {
@protected
	WEGenericEditViewController *_valueController;
	WEGenericTableViewController *_parentViewController;
}

- (id) initWithParentViewController:(WEGenericTableViewController*) viewController;

@property (nonatomic, retain) WEGenericTableViewController *parentViewController;

@end
