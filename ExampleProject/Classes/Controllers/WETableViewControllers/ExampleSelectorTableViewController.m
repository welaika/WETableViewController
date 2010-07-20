
#import "ExampleSelectorTableViewController.h"
#import "WEActionCellController.h"
#import "WEMultilineLabelCellController.h"
#import "ReadOnlyExampleTableViewController.h"
#import "EditFormExampleTableViewController.h"
#import "CustomCellsExampleTableViewController.h"

@implementation ExampleSelectorTableViewController

- (void) viewDidLoad
{
	self.title = @"WETableView";
}

- (void)constructTableGroups
{
	
	WEMultilineLabelCellController *_descriptionCellController = [[[WEMultilineLabelCellController alloc] initWithText:@"Please select one of the following example. They all demonstrate some different feature of the WETableView library."] autorelease];	
	
	NSMutableArray *rows = [NSMutableArray array];
	
	WEActionCellController *_readOnlyExampleCellController = [[[WEActionCellController alloc] initWithLabel:@"Read Only Table" Observer:self Selector:@selector(readOnlyExampleClick:)] autorelease];
	WEActionCellController *_editFormExampleCellController = [[[WEActionCellController alloc] initWithLabel:@"Editing Form" Observer:self Selector:@selector(editingFormExampleClick:)] autorelease];
	WEActionCellController *_customCellsExampleCellController = [[[WEActionCellController alloc] initWithLabel:@"Custom Cells" Observer:self Selector:@selector(customCellsExampleClick:)] autorelease];
	
	[rows addObject:_readOnlyExampleCellController];
	[rows addObject:_editFormExampleCellController];
	[rows addObject:_customCellsExampleCellController];
	
	_tableGroups = [[NSArray arrayWithObjects:
					 [NSArray arrayWithObject: _descriptionCellController],
					 rows,
					 nil
				   ]retain];
	
	_tableSections = [[NSArray arrayWithObjects:@"Welcome!", @"Examples", nil] retain];
}

- (void) readOnlyExampleClick: (id) sender
{
	ReadOnlyExampleTableViewController *viewController = [[[ReadOnlyExampleTableViewController alloc] init] autorelease];
	[self.navigationController pushViewController:viewController animated:YES];
}

- (void) editingFormExampleClick: (id) sender
{
	EditFormExampleTableViewController *viewController = [[[EditFormExampleTableViewController alloc] init] autorelease];
	[self.navigationController pushViewController:viewController animated:YES];
}

- (void) customCellsExampleClick: (id) sender
{
	CustomCellsExampleTableViewController *viewController = [[[CustomCellsExampleTableViewController alloc] init] autorelease];
	[self.navigationController pushViewController:viewController animated:YES];
}

@end
