//
//  WEEditableCaptionedCellController.m
//  iSindone
//
//  Created by Stefano Verna on 26/02/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import "WEEditableCaptionedCellController.h"
#import "UIColor+Hex.h"
@interface WEEditableCaptionedCellController()
- (CGFloat) calculateValueHeight;
@end

@implementation WEEditableCaptionedCellController

@synthesize parentViewController = _parentViewController;

- (id) initWithParentViewController:(WETableViewController*) viewController
{
	self = [super init];
	if (self != nil) {	
		_parentViewController = [viewController retain];
		_cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

	}
	return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	float valueHeight = [self calculateValueHeight];
	
	NSLog(@"%f", valueHeight);
	
	_cell.frame = CGRectMake(0, 0, 320, valueHeight + 20.0f);
	_titleLabel.frame = CGRectMake(10.0, 10.0, 65.0, valueHeight);
	_valueLabel.frame = CGRectMake(80.0, 10.0, 190.0, valueHeight);
	
	if (_value && [[_valueController valueStringRepresentationFor:_value] length]) {
		_valueLabel.text = [_valueController valueStringRepresentationFor:_value];
	} else {
		_valueLabel.text = _placeholder;
	}
	
	return _cell;
}

- (void) setValue:(id) value
{	
	[_value release];
	_value = [value retain];
	if (_value && [[_valueController valueStringRepresentationFor:_value] length]) {
		_valueLabel.text = [_valueController valueStringRepresentationFor:_value];
	} else {
		_valueLabel.text = _placeholder;
	}
	
	[_parentViewController reloadData];
}

- (void) setTitle:(NSString*) title
{	
	[_title release];
	_title = [title retain];
	_titleLabel.text = _title;
	[_parentViewController reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath	animated:YES];
	_valueController.value = _value;
	[_parentViewController.navigationController pushViewController:_valueController animated:YES];
}

- (CGFloat) calculateValueHeight
{
	CGSize constraint = CGSizeMake(180.0f, 20000.0f);
	CGSize size = [[_valueController valueStringRepresentationFor:_value] sizeWithFont:_valueLabel.font constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
	return MIN(MAX(size.height, _valueLabel.font.pointSize + 4), 100);
}

@end
