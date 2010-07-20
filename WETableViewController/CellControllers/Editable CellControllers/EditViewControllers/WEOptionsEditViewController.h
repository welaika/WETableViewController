#import <Foundation/Foundation.h>
#import "WEEditViewController.h"
@interface WEOptionsEditViewController : WEEditViewController {
@private
	NSDictionary *_options;
}

@property (nonatomic, retain) NSDictionary *options;
@end
