
#import "WEAddressEditViewController.h"
#import "Address.h"
#import "WEEditableCaptionedCellController.h"

@interface WEAddressEditViewController()
- (UITextField*) makeTextField;
- (void) setupField: (UITextField*) textField;
@end


@implementation WEAddressEditViewController
- (id) initWithCellController:(WEEditableCaptionedCellController*) cellController
{
	self = [super initWithCellController:cellController];
	if (self != nil) {
		
		countryTextField = [self makeTextField];
		countryTextField.placeholder = NSLocalizedString(@"Paese", @"");
		cityTextField = [self makeTextField];
		cityTextField.placeholder = NSLocalizedString(@"Città", @"");
		streetTextField = [self makeTextField];
		streetTextField.placeholder = NSLocalizedString(@"Strada", @"");
		houseNumberTextField = [self makeTextField];
		houseNumberTextField.placeholder = NSLocalizedString(@"Numero civico", @"");
		
		countryCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];	
		cityCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];	
		houseNumberCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];	
		streetCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];	
		
	}
	return self;
}

- (UITextField*) makeTextField
{
	UITextField *textField = [[UITextField alloc] initWithFrame:CGRectZero];
	textField.borderStyle = UITextBorderStyleNone;
	textField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	textField.returnKeyType = UIReturnKeyDone;
	textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	textField.autocorrectionType = UITextAutocorrectionTypeNo;
	textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
	textField.delegate = self;
	return textField;
}

- (void) setupField: (UITextField*) textField
{
	textField.frame = CGRectMake(10, 10, 300 - 20, self.tableView.rowHeight - 20);
	textField.font = _cellController.valueLabel.font;
	textField.textColor = _cellController.valueLabel.textColor;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.tableView.scrollEnabled = NO;
	self.tableView.allowsSelection = NO;
	
	Address *address = (Address*) _cellController.value;
	
	[self setupField: countryTextField];
	[self setupField: cityTextField];
	[self setupField: streetTextField];
	[self setupField: houseNumberTextField];
	
	countryTextField.text = address.country;
	cityTextField.text = address.city;
	streetTextField.text = address.street;
	houseNumberTextField.text = address.houseNumber;
		
	[countryCell.contentView addSubview:countryTextField];
	[cityCell.contentView addSubview:cityTextField];
	[streetCell.contentView addSubview:streetTextField];
	[houseNumberCell.contentView addSubview:houseNumberTextField];
	
}

- (void)viewDidAppear:(BOOL)animated
{
	[streetTextField becomeFirstResponder];
}

- (void)viewDidUnload {

}

- (void) onSave {
	if (countryTextField.text.length || cityTextField.text.length || streetTextField.text.length) {
		Address *address = [[[Address alloc] init] autorelease];
		address.country = countryTextField.text;
		address.city = cityTextField.text;
		address.street = streetTextField.text;
		address.houseNumber = houseNumberTextField.text;
		_cellController.value = address;
	} else {
		_cellController.value = Nil;
	}
	[self.navigationController popViewControllerAnimated: YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 0.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.row == 0) {
		return streetCell;
	}
	if (indexPath.row == 1) {
		return houseNumberCell;
	}
	if (indexPath.row == 2) {
		return cityCell;
	}
	if (indexPath.row == 3) {
		return countryCell;
	}
	return Nil;
}

- (void)dealloc {
	[countryTextField release];
	[cityTextField release];
	[streetTextField release];
	[houseNumberTextField release];
	
	[countryCell release];
	[cityCell release];
	[streetCell release];
	[houseNumberCell release];
	[super dealloc];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 4;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
	return YES;
}

@end
