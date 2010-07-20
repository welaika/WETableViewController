//
//  WEContactCellController.m
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
#import "WEContactCellController.h"

@implementation WEContactCellController

- (id)initWithContact:(ContactInformation *)contact
{
	self = [super init];
	if (self != nil)
	{
		_contact = [contact retain];
		self.title = _contact.title;
		self.value = _contact.value;
		_cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	return self;
}

- (void)dealloc
{
	[_contact release];
	[super dealloc];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath	animated:YES];
	[_contact performAction];
}

@end
