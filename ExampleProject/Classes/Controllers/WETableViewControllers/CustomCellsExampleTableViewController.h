//
//  CustomCellsExampleTableViewController.h
//  ExampleProject
//
//  Created by Stefano Verna on 20/07/10.
//  Copyright 2010 Seac02 s.r.l. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WETableViewController.h"
#import "WEAddressCellController.h"
#import "WEContactCellController.h"

@interface CustomCellsExampleTableViewController : WETableViewController {
@private
	WEAddressCellController *_addressCellController;
	WEContactCellController *_emailCellController;
	WEContactCellController *_websiteCellController;
	WEContactCellController *_phoneNumberCellController;
}

@end
