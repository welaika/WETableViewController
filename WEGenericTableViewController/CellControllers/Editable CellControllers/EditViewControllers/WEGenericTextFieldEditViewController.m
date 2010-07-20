//
//  WEGenericTextFieldEditViewController.m
//  iSindone
//
//  Created by Stefano Verna on 26/02/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import "WEGenericTextFieldEditViewController.h"
#import "WEEditableCaptionedCellController.h"
@implementation WEGenericTextFieldEditViewController
- (id) initWithCellController:(WEEditableCaptionedCellController*) cellController
{
	self = [super initWithCellController:cellController];
	if (self != nil) {
		_textField = [[UITextField alloc] initWithFrame:CGRectZero];
		_textField.borderStyle = UITextBorderStyleNone;
		_textField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		_textField.returnKeyType = UIReturnKeyDone;
		_textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
		_textField.autocorrectionType = UITextAutocorrectionTypeNo;
		_textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
		_textField.delegate = self;
		
		[_textField addTarget:self 
						action:@selector(methodToFire:)
			  forControlEvents:UIControlEventEditingDidEndOnExit];
		
		
		_cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];	
	}
	return self;
}

- (void) methodToFire:(id)sender
{
	[self onSave];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.tableView.scrollEnabled = NO;
	self.tableView.allowsSelection = NO;
	
	_textField.frame = CGRectMake(10, 10, 300 - 20, self.tableView.rowHeight - 20);
	_textField.font = _cellController.valueLabel.font;
	_textField.textColor = _cellController.valueLabel.textColor;
	_textField.placeholder = _cellController.placeholder;		
	_textField.text = _cellController.value;
	
	[_cell.contentView addSubview:_textField];
}

- (void)viewDidAppear:(BOOL)animated
{
	[_textField becomeFirstResponder];
}

- (void)viewDidUnload {
	[_textField release];
	_textField = nil;
	[_cell release];
	_cell = nil;
}

- (void) onSave {
	_cellController.value = _textField.text;
	[self.navigationController popViewControllerAnimated: YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 67.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	return _cell;
}

- (void)dealloc {
	[_textField release];
	[_cell release];
	[super dealloc];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
	[self.navigationController popViewControllerAnimated:YES];
	return YES;
}

@end
