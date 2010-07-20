//
//  WeAddressCellController.m
//  iSindone
//
//  Created by Stefano Verna on 11/03/10.
//  Copyright 2010 WeLaika. All rights reserved.
//

#import "WEAddressCellController.h"
#import "WEGenericAddressEditViewController.h"

@implementation WEAddressCellController

- (id) initWithParentViewController:(WEGenericTableViewController*) viewController
{
	self = [super initWithParentViewController:viewController];
	if (self != nil) {
		_valueController = [[WEGenericAddressEditViewController alloc] initWithCellController:self];
	}
	return self;
}
@end
