//
//  WETextFieldCellController.m
//  iSindone
//
//  Created by Stefano Verna on 27/02/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import "WETextFieldCellController.h"
#import "WETextFieldEditViewController.h"
@implementation WETextFieldCellController
- (id) initWithParentViewController:(WETableViewController*) viewController
{
	self = [super initWithParentViewController:viewController];
	if (self != nil) {
		_valueController = [[WETextFieldEditViewController alloc] initWithCellController:self];
	}
	return self;
}

@end
