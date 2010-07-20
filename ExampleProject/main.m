//
//  main.m
//  ExampleProject
//
//  Created by Stefano Verna on 20/07/10.
//  Copyright Seac02 s.r.l. 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"ExampleProjectAppDelegate");
    [pool release];
    return retVal;
}
