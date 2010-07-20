//
//  WEEditViewController.h
//  iSindone
//
//  Created by Stefano Verna on 26/02/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import <UIKit/UIKit.h>
@class WEEditableCaptionedCellController;
@interface WEEditViewController : UITableViewController {
@protected
	WEEditableCaptionedCellController *_cellController;
	UIView *_emptyHeaderView;
	id _value;
}

- (id) initWithCellController:(WEEditableCaptionedCellController*) cellController;
- (NSString*) valueStringRepresentationFor:(id) value;
- (void) onSave;

@property (nonatomic, retain) id value;
@end
