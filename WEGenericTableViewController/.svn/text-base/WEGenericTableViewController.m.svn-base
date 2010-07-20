//
//  WEGenericTableViewController.m
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
#import "WEGenericTableViewController.h"
#import "WECellController.h"

@implementation WEGenericTableViewController
- (id) init
{
	self = [super initWithStyle:UITableViewStyleGrouped];
	if (self != nil) {
	}
	return self;
}

- (void) reloadData
{
	if (_tableGroups) {
		[self.tableView reloadData];
	}
}

- (void)constructTableGroups
{
	_tableGroups = [[NSArray arrayWithObject:[NSArray array]] retain];
	_tableSections = [[NSArray array] retain];
}

- (void)clearTableGroups
{
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	if (!_tableGroups)
	{
		[self constructTableGroups];
	}
	
	return [_tableGroups count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (!_tableGroups)
	{
		[self constructTableGroups];
	}
	
	return [[_tableGroups objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (!_tableGroups)
	{
		[self constructTableGroups];
	}
	
	return
		[[[_tableGroups objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]
			tableView:(UITableView *)tableView
			cellForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (!_tableGroups)
	{
		[self constructTableGroups];
	}
	
	NSObject<WECellController> *cellData =
		[[_tableGroups objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	if ([cellData respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)])
	{
		[cellData tableView:tableView didSelectRowAtIndexPath:indexPath];
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (!_tableGroups)
	{
		[self constructTableGroups];
	}
	
	NSObject<WECellController> *cellData = [[_tableGroups objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	if ([cellData respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)])
	{
		return [cellData tableView:tableView heightForRowAtIndexPath:indexPath];
	} else {
		return self.tableView.rowHeight;
	}
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	if (!_tableGroups)
	{
		[self constructTableGroups];
	}
	
	if ([_tableSections count] > section) {
		return [_tableSections objectAtIndex:section];
	}
	else {
		return nil;
	}
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	
	[self clearTableGroups];
}

- (void)dealloc
{
	[self clearTableGroups];
	[super dealloc];
}

@end
