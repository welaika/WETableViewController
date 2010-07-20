
#import "CustomCellsExampleTableViewController.h"
#import "Address.h"

@implementation CustomCellsExampleTableViewController


- (void)constructTableGroups
{
	_addressCellController = [[WEAddressCellController alloc] initWithParentViewController:self];
	_addressCellController.title = @"Address";
	
	Address *address = [Address address];
	address.city = @"Turin";
	address.country = @"Italy";
	address.houseNumber = @"7";
	address.street = @"Via Salgari";
	
	_addressCellController.value = address;
	
	
	ContactInformation *phoneNumber = [ContactInformation contactWithType:ContactTypePhoneNumber title:@"Phone Number" value:@"+39 011-23.86.330"];
	ContactInformation *email = [ContactInformation contactWithType:ContactTypeEmail title:@"Email" value:@"info@welaika.com"];
	ContactInformation *website = [ContactInformation contactWithType:ContactTypeWebsite title:@"Website" value:@"http://www.welaika.com"];
	
	_phoneNumberCellController = [[WEContactCellController alloc] initWithContact: phoneNumber];
	_emailCellController = [[WEContactCellController alloc] initWithContact: email];
	_websiteCellController = [[WEContactCellController alloc] initWithContact: website];
	
	NSMutableArray *rows = [NSMutableArray array];
	[rows addObject:_addressCellController];
	[rows addObject:_phoneNumberCellController];
	[rows addObject:_emailCellController];
	[rows addObject:_websiteCellController];
	
	_tableGroups = [[NSArray arrayWithObject: rows] retain];
	_tableSections = [[NSArray array] retain];
}


@end
