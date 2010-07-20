//
//  WEDatePickerEditViewController.m
//  iSindone
//
//  Created by Stefano Verna on 28/02/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import "WEDatePickerEditViewController.h"
#import "WEEditableCaptionedCellController.h"

@implementation WEDatePickerEditViewController
@synthesize datePicker;
- (id) initWithCellController:(WEEditableCaptionedCellController*) cellController
{
	self = [super initWithCellController:cellController];
	if (self != nil) {
		datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0.0, 200.0, 320.0, 216.0)];
		datePicker.datePickerMode = UIDatePickerModeDate;
		[datePicker addTarget:self action:@selector(dateChanged) forControlEvents:UIControlEventValueChanged];
		
		label = [[UILabel alloc] initWithFrame:CGRectZero];
		label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		label.font = _cellController.valueLabel.font;
		label.textColor = _cellController.valueLabel.textColor;
		label.text = [self valueStringRepresentationFor:_cellController.value];
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	}
	return self;
}

- (NSString*) valueStringRepresentationFor:(id) value
{
	NSDate *date = value;
	
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormatter setDateFormat:NSLocalizedString(@"MMMM d, YYYY", "")];
	
	return [[dateFormatter stringFromDate:date] capitalizedString];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.tableView.allowsSelection = NO;
	self.tableView.scrollEnabled = NO;
	
	label.frame = CGRectMake(10, 10, 300 - 20, self.tableView.rowHeight - 20);
	label.text = [self valueStringRepresentationFor:datePicker.date];
	
	[cell.contentView addSubview:label];
	[self.tableView addSubview:datePicker];
}

- (void)viewDidAppear:(BOOL)animated
{
	[label becomeFirstResponder];
}

- (void)viewDidUnload {
	[label release];
	[cell release];
	[datePicker release];
}

- (void) onSave {
	_cellController.value = datePicker.date;
	[self.navigationController popViewControllerAnimated: YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 67.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	return cell;
}

- (void)dealloc {
	[label release];
	[datePicker release];
	[cell release];
	[super dealloc];
}

- (void) dateChanged
{
	label.text = [self valueStringRepresentationFor:datePicker.date];
}

@end
