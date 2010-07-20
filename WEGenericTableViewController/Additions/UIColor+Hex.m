//
//  UIColor+Hex.m
//  iSindone
//
//  Created by Stefano Verna on 21/02/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import "UIColor+Hex.h"

@implementation UIColor(Hexadecimal)
+ (id) colorWithHexadecimal:(int) rgbValue
{
	return [UIColor 
			colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 
			green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
			blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0
			];
}

@end
