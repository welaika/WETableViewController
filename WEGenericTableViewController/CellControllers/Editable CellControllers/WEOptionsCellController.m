//
//  WETextFieldCellController.m
//  iSindone
//
//  Created by Stefano Verna on 27/02/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import "WEOptionsCellController.h"
#import "WEGenericOptionsEditViewController.h"
@implementation WEOptionsCellController
- (id) initWithParentViewController:(WEGenericTableViewController*) viewController
{
	self = [super initWithParentViewController:viewController];
	if (self != nil) {
		_valueController = [[WEGenericOptionsEditViewController alloc] initWithCellController:self];
	}
	return self;
}

- (NSDictionary*) options
{
	return [(WEGenericOptionsEditViewController*) _valueController options];
}

- (void) setOptions: (NSDictionary*) options
{
	[(WEGenericOptionsEditViewController*) _valueController setOptions: options];
}

@end
