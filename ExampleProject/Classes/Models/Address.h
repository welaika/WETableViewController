//
//  Address.h
//  iSindone
//
//  Created by Stefano Verna on 11/03/10.
//  Copyright 2010 WeLaika. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Address : NSObject <NSCoding, NSCopying> {
	NSString *_country;
	NSString *_city;
	NSString *_street;
	NSString *_houseNumber;
}

+ (id) address;

@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *street;
@property (nonatomic, copy) NSString *houseNumber;

@end
