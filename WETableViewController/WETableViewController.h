#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface WETableViewController : UITableViewController
{
	NSArray *_tableGroups;
	NSArray *_tableSections;
}

- (void) reloadData; 
- (void) constructTableGroups;
@end
