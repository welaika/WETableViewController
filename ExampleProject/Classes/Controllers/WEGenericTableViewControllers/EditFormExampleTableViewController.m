//
//  EditFormExampleTableViewController.m
//  ExampleProject
//
//  Created by Stefano Verna on 20/07/10.
//  Copyright 2010 Seac02 s.r.l. All rights reserved.
//

#import "EditFormExampleTableViewController.h"
#import "WEActionCellController.h"

@implementation EditFormExampleTableViewController

- (void)constructTableGroups
{
	_textFieldCellController = [[WETextFieldCellController alloc] initWithParentViewController:self];
	_textFieldCellController.title = @"Full Name";
	_textFieldCellController.value = @"John Smith";
	
	_textViewCellController = [[WETextViewCellController alloc] initWithParentViewController:self];
	_textViewCellController.title = @"Description";
	_textViewCellController.value = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ullamcorper cursus ante aliquet ornare. Donec sapien turpis, volutpat a dignissim eu, rutrum sit amet dui.";
	
	_optionsCellController = [[WEOptionsCellController alloc] initWithParentViewController:self];
	_optionsCellController.title = @"Language";
	
	NSMutableDictionary *languageDictionary = [NSMutableDictionary dictionary];
	[languageDictionary setObject:@"English" forKey:[NSNumber numberWithInt:0]];
	[languageDictionary setObject:@"Italian" forKey:[NSNumber numberWithInt:1]];
	[languageDictionary setObject:@"French" forKey:[NSNumber numberWithInt:2]];
	[languageDictionary setObject:@"Chinese" forKey:[NSNumber numberWithInt:3]];
	
	_optionsCellController.options = languageDictionary;
	_optionsCellController.value = [NSNumber numberWithInt:1];
	
	_datePickerCellController = [[WEDatePickerCellController alloc] initWithParentViewController:self];
	_datePickerCellController.title = @"Birthday";
	_datePickerCellController.value = [NSDate date];
	
	WEActionCellController *_actionCellController = [[WEActionCellController alloc] initWithLabel:@"Show Results!" Observer:self Selector:@selector(actionCellClick:)];	
	
	NSMutableArray *rows = [NSMutableArray array];
	[rows addObject:_textFieldCellController];
	[rows addObject:_textViewCellController];
	[rows addObject:_optionsCellController];
	[rows addObject:_datePickerCellController];
	[rows addObject:_actionCellController];
	
	_tableGroups = [[NSArray arrayWithObject: rows] retain];
	_tableSections = [[NSArray array] retain];
}

- (void) actionCellClick: (id) sender
{
	
	NSMutableString *string = [NSMutableString string];
	[string appendFormat:@"Fullname: %@\n", _textFieldCellController.value];
	[string appendFormat:@"Description: %@\n", _textViewCellController.value];
	[string appendFormat:@"Language ID: %@\n", _optionsCellController.value];
	[string appendFormat:@"Birthday: %@\n", _datePickerCellController.value];
	
	UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Some Action" message:string delegate:nil cancelButtonTitle:@"Got it, thanks." otherButtonTitles:nil] autorelease];
	[alert show];
}

@end
