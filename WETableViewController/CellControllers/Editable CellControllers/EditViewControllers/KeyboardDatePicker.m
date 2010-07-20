#import "KeyboardDatePicker.h"
@interface KeyboardDatePicker()
- (void) onCancelButtonClick:(id) sender;
- (void) onDoneButtonClick:(id) sender;
@end
@implementation KeyboardDatePicker
@synthesize picker = _picker;
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id) init
{
	if (self = [super init]) {
		UIToolbar *toolbar = [[[UIToolbar alloc] initWithFrame:CGRectMake(0,0,320,44)] autorelease];
		toolbar.barStyle = UIBarStyleBlack;
		
		_doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Fatto" style:UIBarButtonItemStyleDone target:self action:@selector(onDoneButtonClick:)];
		_doneButton.width = 110;
		_cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Annulla" style:UIBarButtonItemStyleBordered target:self action:@selector(onCancelButtonClick:)];
		_cancelButton.width = 110;
		UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:Nil action:Nil];
		toolbar.items = [NSArray arrayWithObjects:_cancelButton, space, _doneButton, Nil];
		[space release];
		
		_picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,260-216,320,216)];
		_picker.datePickerMode = UIDatePickerModeDate;
		[self.view addSubview:toolbar];
		[self.view addSubview:_picker];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

-(void) addToViewWithAnimation:(UIView *) parentView
{
	_backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
	_backgroundView.backgroundColor = [UIColor blackColor];
	_backgroundView.alpha = 0.6;
	[parentView addSubview:_backgroundView];
	
	self.view.frame = CGRectMake(0,parentView.frame.size.height,320,260);
	[parentView addSubview:self.view];
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];  
	self.view.frame = CGRectMake(0,parentView.frame.size.height-260,320,260);
	
	[UIView commitAnimations];
}

-(void) removeWithAnimation
{
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(AnimationDidStop:)];
	[UIView setAnimationDuration:0.5];  
	self.view.frame = CGRectMake(0,480,320,260);
	_backgroundView.alpha = 0;  //fades shade to nothing
	[UIView commitAnimations];
}

-(void) AnimationDidStop:(id) object
{
	[self.view removeFromSuperview];  //removes view after animations.
	[_backgroundView removeFromSuperview];
}

- (void) onCancelButtonClick:(id) sender
{
	[self removeWithAnimation];
}

- (void) onDoneButtonClick:(id) sender
{
	if (_observer && [_observer respondsToSelector:_selector]) {
		[_observer performSelector:_selector withObject:self];
	}
}

- (void)dealloc {
	[_observer release];
	[_picker release];
	[_backgroundView release];
	[_doneButton release];
	[_cancelButton release];
	[super dealloc];
}

- (void) addDoneObserver:(id) observer Selector:(SEL) selector
{
	_observer = [observer retain];
	_selector = selector;
}

@end