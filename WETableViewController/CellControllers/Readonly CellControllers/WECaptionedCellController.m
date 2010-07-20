//
//  WEEditableCaptionedCellController.m
//  iSindone
//
//  Created by Stefano Verna on 26/02/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import "WECaptionedCellController.h"
#import "UIColor+Hex.h"
@interface WECaptionedCellController()
- (CGFloat) calculateValueHeight;
@end

@implementation WECaptionedCellController
@synthesize title = _title;
@synthesize titleLabel = _titleLabel;
@synthesize valueLabel = _valueLabel;
@synthesize placeholder = _placeholder;
@synthesize value = _value;
@synthesize observer = _observer;
@synthesize selectionTarget = _selectionTarget;

- (id) init
{
	self = [super init];
	if (self != nil) {
		
		_cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
		
		CGFloat fontSize = [UIFont labelFontSize] - 2;
		_titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		_titleLabel.textAlignment = UITextAlignmentLeft;
		_titleLabel.font = [UIFont boldSystemFontOfSize:fontSize - 2];
		_titleLabel.textColor = [UIColor grayColor];
		_titleLabel.minimumFontSize = fontSize - 5;
		_titleLabel.adjustsFontSizeToFitWidth = YES;
		[_cell.contentView addSubview:_titleLabel];
		
		_valueLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		_valueLabel.textAlignment = UITextAlignmentLeft;
		_valueLabel.lineBreakMode = UILineBreakModeWordWrap;
		_valueLabel.numberOfLines = 100;
		_valueLabel.font = [UIFont boldSystemFontOfSize:fontSize];
		_valueLabel.textColor = [UIColor blackColor];
		[_cell.contentView addSubview:_valueLabel];
		
	}
	return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	float valueHeight = [self calculateValueHeight];
	
	_cell.frame = CGRectMake(0, 0, 320, valueHeight + 20.0f);
	_titleLabel.frame = CGRectMake(10.0, 10.0, 65.0, valueHeight);
	_valueLabel.frame = CGRectMake(80.0, 10.0, 190.0, valueHeight);
	
	_titleLabel.text = [_title description];
	
	if (_value) {
		_valueLabel.text = [_value description];
	} else {
		_valueLabel.text = _placeholder;
	}
	
	return _cell;
}

- (void) setValue:(id) value
{	
	[_value release];
	
	_value = [value retain];
	
	if (value) {
		_valueLabel.text = [_value description];
	} else {
		_valueLabel.text = _placeholder;
	}
	
}

- (void) setTitle:(NSString*) title
{	
	[_title release];
	_title = [title retain];
	_titleLabel.text = _title;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return [self calculateValueHeight] + (10.0f * 2.0f);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath	animated:YES];
	if (_observer && [_observer respondsToSelector:_selectionTarget]) {
		[_observer performSelector:_selectionTarget withObject:self];
	}
}

- (void) setObserver: (id) observer
{
	[_observer release];
	_observer = [observer retain];
	if (_observer && [_observer respondsToSelector:_selectionTarget]) {
		_cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
}

- (void) setSelectionTarget: (SEL) target
{
	_selectionTarget = target;
	if (_observer && [_observer respondsToSelector:_selectionTarget]) {
		_cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}	
}

- (CGFloat) calculateValueHeight
{
	CGSize constraint = CGSizeMake(180.0f, 20000.0f);
	CGSize size = [[_value description] sizeWithFont:_valueLabel.font constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
	return MIN(MAX(size.height, 22.0f), 100);
}

@end
