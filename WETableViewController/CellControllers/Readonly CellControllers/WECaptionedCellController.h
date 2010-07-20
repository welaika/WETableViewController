//
//  WEEditableCaptionedCellController.h
//  iSindone
//
//  Created by Stefano Verna on 26/02/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "WECellController.h"
#import "WEEditViewController.h"
#import "WETableViewController.h"

@interface WECaptionedCellController : NSObject <WECellController> {
@protected
	NSString *_title;
	NSString *_placeholder;
	UITableViewCell *_cell;
	UILabel *_titleLabel;
	UILabel *_valueLabel;
	id _value;
	id _observer;
	SEL _selectionTarget;
}

@property (nonatomic, readonly) UILabel *titleLabel;
@property (nonatomic, readonly) UILabel *valueLabel;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, retain) id value;
@property (nonatomic, retain) id observer;
@property (nonatomic, assign) SEL selectionTarget;
@end
