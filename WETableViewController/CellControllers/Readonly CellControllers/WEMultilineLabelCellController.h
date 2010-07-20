//
//  WEMultilineLabelCellController.h
//  iSindone
//
//  Created by Stefano Verna on 21/02/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface WEMultilineLabelCellController : NSObject {
@private
	NSString *_description;
	float _margin;
	float _labelFontSize;
}

@property (nonatomic, readonly) NSString *description;
- (id) initWithText:(NSString*) description;
@end
