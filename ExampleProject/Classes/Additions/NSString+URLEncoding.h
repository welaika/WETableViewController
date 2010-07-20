//
//  NSString+URLEncoding.h
//  iSindone
//
//  Created by Stefano Verna on 05/03/10.
//  Copyright 2010 WeLaika. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface NSString(URLEncoding) 
- (NSString*) telephoneNumber;
- (NSString*) urlEncoded;
+ (NSString*) stringWithDistance: (float) distance;
@end