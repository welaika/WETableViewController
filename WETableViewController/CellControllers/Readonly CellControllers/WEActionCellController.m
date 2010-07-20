//
//  WEActionCellController.m
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
#import "WEActionCellController.h"
@implementation WEActionCellController

@synthesize label = _label;

- (id)initWithLabel:(NSString *)newLabel Observer:(id) observer Selector:(SEL) selector
{
	self = [super init];
	if (self != nil)
	{
		_cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
		_cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

		CGFloat fontSize = [UIFont labelFontSize];
		_label = [[UILabel alloc] initWithFrame:CGRectZero];
		_label.textAlignment = UITextAlignmentLeft;
		_label.font = [UIFont boldSystemFontOfSize:fontSize];
		_label.textColor = [UIColor blackColor];
		_label.minimumFontSize = fontSize - 3;
		_label.adjustsFontSizeToFitWidth = YES;
		_label.text = newLabel;
		[_cell.contentView addSubview:_label];
		
		_observer = [observer retain];
		_selector = selector;
	}
	return self;
}

- (void)dealloc
{
	[_label release];
	[super dealloc];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (_observer && [_observer respondsToSelector:_selector]) {
		[_observer performSelector:_selector withObject:indexPath];
	}
	[tableView deselectRowAtIndexPath:indexPath	animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	_cell.frame = CGRectMake(0, 0, 320, tableView.rowHeight);
	_label.frame = CGRectMake(10.0, 10.0, 270, tableView.rowHeight - 20);
	
	return _cell;
}

@end
