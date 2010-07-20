//
//  WEActionCellController.h
//  PhoneNumbers
//
//  Created by Matt Gallagher on 27/12/08.
//  Copyright 2008 Matt Gallagher. All rights reserved.
//
//  Permission is given to use this source code file, free of charge, in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//
#import <UIKit/UIKit.h>
#import "WECellController.h"

@interface WEActionCellController : NSObject <WECellController>
{
	id _observer;
	SEL _selector;
	UILabel *_label;
	UITableViewCell *_cell;
	
}

- (id)initWithLabel:(NSString *)newLabel Observer:(id) observer Selector:(SEL) selector;

@property (nonatomic, readonly) UILabel *label;
@end
