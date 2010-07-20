//
//  WEGenericTextViewEditViewController.m
//  iSindone
//
//  Created by Stefano Verna on 01/03/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import "WEGenericTextViewEditViewController.h"
#import "WEEditableCaptionedCellController.h"
@implementation WEGenericTextViewEditViewController

- (id) initWithCellController:(WEEditableCaptionedCellController*) cellController
{
	self = [super initWithCellController:cellController];
	if (self != nil) {
		
		_textView = [[UITextView alloc] initWithFrame:CGRectZero];
		_textView.textAlignment = UITextAlignmentLeft;
		_textView.returnKeyType = UIReturnKeyDefault;
		_textView.autocorrectionType = UITextAutocorrectionTypeNo;
		_textView.autocapitalizationType = UITextAutocapitalizationTypeSentences;
		
		_cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];	
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.tableView.allowsSelection = NO;
	self.tableView.scrollEnabled = NO;
	
	_textView.frame = CGRectMake(10, 10, 300 - 20, 160);
	_textView.font = _cellController.valueLabel.font;
	_textView.textColor = _cellController.valueLabel.textColor;
	_textView.text = _cellController.value;
	
	_cell.frame = CGRectMake(0, 0, 300, 180);
	[_cell.contentView addSubview:_textView];
}

- (void)viewDidAppear:(BOOL)animated
{
	[_textView becomeFirstResponder];
}

- (void) onSave {
	_cellController.value = _textView.text;
	[self.navigationController popViewControllerAnimated: YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	return _cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 180;
}

- (void)dealloc {
	[_textView release];
	[_cell release];
	[super dealloc];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
	[self.navigationController popViewControllerAnimated:YES];
	return YES;
}


@end
