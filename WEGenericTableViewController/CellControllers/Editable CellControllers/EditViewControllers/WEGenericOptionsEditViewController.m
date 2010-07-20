//
//  WEGenericTextViewEditViewController.m
//  iSindone
//
//  Created by Stefano Verna on 01/03/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import "WEGenericOptionsEditViewController.h"
#import "WEEditableCaptionedCellController.h"
@implementation WEGenericOptionsEditViewController
@synthesize options = _options;
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"OptionsCell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	
	if (_cellController.value == [[_options allKeys] objectAtIndex: indexPath.row]) {
		cell.accessoryType = UITableViewCellAccessoryCheckmark;	
	} else {
		cell.accessoryType = UITableViewCellAccessoryNone;	
	}
	
	cell.textLabel.text = [[_options allValues] objectAtIndex: indexPath.row];
	
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [_options count];
}

- (void)dealloc {
	[_options release];
	[super dealloc];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath	animated:YES];
	_cellController.value = [[_options allKeys] objectAtIndex: indexPath.row];
	[tableView reloadData];
	[self.navigationController popViewControllerAnimated: YES];
}

- (NSString*) valueStringRepresentationFor:(id) value
{
	return [_options objectForKey:value];
}


@end
