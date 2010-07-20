#import <UIKit/UIKit.h>
#import "WECaptionedCellController.h"
#import "ContactInformation.h"

@interface WEContactCellController : WECaptionedCellController
{
	ContactInformation *_contact;
}

- (id)initWithContact:(ContactInformation*)contact;
@end
