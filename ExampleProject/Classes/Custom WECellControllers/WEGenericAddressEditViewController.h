//
//  WEGenericAddressEditViewController.h
//  iSindone
//
//  Created by Stefano Verna on 11/03/10.
//  Copyright 2010 WeLaika. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WEGenericEditViewController.h"

@interface WEGenericAddressEditViewController : WEGenericEditViewController <UITextFieldDelegate> {
	UITableViewCell *streetCell;
	UITextField *streetTextField;
	UITableViewCell *cityCell;
	UITextField *cityTextField;
	UITableViewCell *houseNumberCell;
	UITextField *houseNumberTextField;
	UITableViewCell *countryCell;
	UITextField *countryTextField;

}

@end
