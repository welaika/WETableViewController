#import "WETableViewController.h"
#import "WECellController.h"

@implementation WETableViewController
- (id) init
{
	self = [super initWithStyle:UITableViewStyleGrouped];
	if (self != nil) {
	}
	return self;
}

- (void) reloadData
{
	if (_tableGroups) {
		[self.tableView reloadData];
	}
}

- (void)constructTableGroups
{
	_tableGroups = [[NSArray arrayWithObject:[NSArray array]] retain];
	_tableSections = [[NSArray array] retain];
}

- (void)clearTableGroups
{
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	if (!_tableGroups)
	{
		[self constructTableGroups];
	}
	
	return [_tableGroups count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (!_tableGroups)
	{
		[self constructTableGroups];
	}
	
	return [[_tableGroups objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (!_tableGroups)
	{
		[self constructTableGroups];
	}
	
	return
		[[[_tableGroups objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]
			tableView:(UITableView *)tableView
			cellForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (!_tableGroups)
	{
		[self constructTableGroups];
	}
	
	NSObject<WECellController> *cellData =
		[[_tableGroups objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	if ([cellData respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)])
	{
		[cellData tableView:tableView didSelectRowAtIndexPath:indexPath];
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (!_tableGroups)
	{
		[self constructTableGroups];
	}
	
	NSObject<WECellController> *cellData = [[_tableGroups objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	if ([cellData respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)])
	{
		return [cellData tableView:tableView heightForRowAtIndexPath:indexPath];
	} else {
		return self.tableView.rowHeight;
	}
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	if (!_tableGroups)
	{
		[self constructTableGroups];
	}
	
	if ([_tableSections count] > section) {
		return [_tableSections objectAtIndex:section];
	}
	else {
		return nil;
	}
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	
	[self clearTableGroups];
}

- (void)dealloc
{
	[self clearTableGroups];
	[super dealloc];
}

@end
