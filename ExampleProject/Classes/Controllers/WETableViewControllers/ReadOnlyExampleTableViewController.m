//
//  ReadOnlyExampleTableViewController.m
//  ExampleProject
//
//  Created by Stefano Verna on 20/07/10.
//  Copyright 2010 Seac02 s.r.l. All rights reserved.
//

#import "ReadOnlyExampleTableViewController.h"
#import "WECaptionedCellController.h"
#import "WEMultilineLabelCellController.h"
#import "WEActionCellController.h"

@implementation ReadOnlyExampleTableViewController

- (void)constructTableGroups
{
	WEMultilineLabelCellController *_firstDescriptionController = [[[WEMultilineLabelCellController alloc] initWithText:@"You can give to WECaptionedCellController any value, it will show its description."] autorelease];
	
	WECaptionedCellController *_firstNameCellController = [[[WECaptionedCellController alloc] init] autorelease];
	_firstNameCellController.title = @"First Name";
	_firstNameCellController.value = @"John";

	WECaptionedCellController *_lastNameCellController = [[[WECaptionedCellController alloc] init] autorelease];
	_lastNameCellController.title = @"Last Name";
	_lastNameCellController.value = @"Woo";	

	WECaptionedCellController *_dateCellController = [[[WECaptionedCellController alloc] init] autorelease];
	_dateCellController.title = @"Some Date";
	_dateCellController.value = [NSDate date];		
	
	WEMultilineLabelCellController *_secondDescriptionController = [[[WEMultilineLabelCellController alloc] initWithText:@"You can give it a nil value, it will render the provided placeholder text."] autorelease];

	WECaptionedCellController *_emailCellController = [[[WECaptionedCellController alloc] init] autorelease];
	_emailCellController.title = @"Email";
	_emailCellController.placeholder = @"No Email provided!";
	_emailCellController.value = nil;		
	
	WEActionCellController *_actionCellController = [[WEActionCellController alloc] initWithLabel:@"Some Action Cell" Observer:self Selector:@selector(actionCellClick:)];	
	
	NSMutableArray *rows = [NSMutableArray array];
	[rows addObject:_firstDescriptionController];
	[rows addObject:_firstNameCellController];
	[rows addObject:_lastNameCellController];
	[rows addObject:_dateCellController];
	[rows addObject:_secondDescriptionController];
	[rows addObject:_emailCellController];
	[rows addObject:_actionCellController];
	
	_tableGroups = [[NSArray arrayWithObject: rows] retain];
	_tableSections = [[NSArray array] retain];
}

- (void) actionCellClick: (id) sender
{
	UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Some Action" message:@"Clicked!" delegate:nil cancelButtonTitle:@"Got it, thanks." otherButtonTitles:nil] autorelease];
	[alert show];
}

@end
