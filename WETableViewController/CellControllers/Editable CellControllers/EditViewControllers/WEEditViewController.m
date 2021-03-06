#import "WEEditViewController.h"
#import "WEEditableCaptionedCellController.h"
@implementation WEEditViewController
@synthesize value = _value;
- (id) initWithCellController:(WEEditableCaptionedCellController*) cellController
{
	self = [super initWithStyle:UITableViewStyleGrouped];
	if (self != nil) {
		_cellController = [cellController retain];
		_emptyHeaderView = [[UIView alloc] init];
		self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(onSave)] autorelease];
	}
	return self;
}

- (void) viewDidLoad
{
}

- (void) viewWillAppear:(BOOL) animated
{
	self.title = _cellController.title;
}

- (void) onSave
{
	[self.navigationController popViewControllerAnimated: YES];
}

- (void) dealloc
{
	[_emptyHeaderView release];
	[_cellController release];
	[super dealloc];
}

- (NSString*) valueStringRepresentationFor:(id) value
{
	return [value description];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellIdentifier = @"EmptyValueViewDataCell";	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (cell == nil)
	{
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:cellIdentifier] autorelease];
	}
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return tableView.rowHeight;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return @"";
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	return _emptyHeaderView;
}

@end
