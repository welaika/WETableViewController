//
//  WeTextViewCellController.m
//  iSindone
//
//  Created by Stefano Verna on 01/03/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import "WETextViewCellController.h"
#import "WETextViewEditViewController.h"
@implementation WETextViewCellController
- (id) initWithParentViewController:(WETableViewController*) viewController
{
	self = [super initWithParentViewController:viewController];
	if (self != nil) {
		_valueController = [[WETextViewEditViewController alloc] initWithCellController:self];
	}
	return self;
}

@end
