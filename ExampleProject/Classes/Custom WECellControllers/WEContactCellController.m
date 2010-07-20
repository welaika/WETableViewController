#import "WEContactCellController.h"

@implementation WEContactCellController

- (id)initWithContact:(ContactInformation *)contact
{
	self = [super init];
	if (self != nil)
	{
		_contact = [contact retain];
		self.title = _contact.title;
		self.value = _contact.value;
		_cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	return self;
}

- (void)dealloc
{
	[_contact release];
	[super dealloc];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath	animated:YES];
	[_contact performAction];
}

@end
