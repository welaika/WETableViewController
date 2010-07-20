#import "WEMultilineLabelCellController.h"
@interface WEMultilineLabelCellController()
- (CGFloat) descriptionHeight;
@end
@implementation WEMultilineLabelCellController
@synthesize description = _description;
- (id) initWithText:(NSString*) description
{
	self = [super init];
	if (self != nil) {
		_description = [description retain];
		_margin = 10.0f;
		_labelFontSize = [UIFont labelFontSize] - 3;
	}
	return self;
}

- (void) dealloc
{
	[_description release];
	[super dealloc];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellIdentifier = @"MultilineTextDataCell";
	const int TEXT_LABEL_TAG = 12001;
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	UILabel *label = nil;
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:cellIdentifier] autorelease];
		label = [[[UILabel alloc]initWithFrame:CGRectZero] autorelease];
		label.tag = TEXT_LABEL_TAG;
		label.font = [UIFont systemFontOfSize:_labelFontSize];
		label.textAlignment = UITextAlignmentLeft;
		label.textColor = [UIColor blackColor];
		label.lineBreakMode = UILineBreakModeWordWrap;
		label.numberOfLines = 100;
		[cell.contentView addSubview:label];
		
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
	} else {
		label = (UILabel *)[cell.contentView viewWithTag:TEXT_LABEL_TAG];
	}
	
	label.frame = CGRectMake(_margin, _margin, 300 - _margin * 2.0f, [self descriptionHeight]);
	cell.frame = CGRectMake(0, 0, 320, tableView.rowHeight);
	label.text = _description;
	
	return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return [self descriptionHeight] + (_margin * 2.0f);
}

- (CGFloat) descriptionHeight
{
	CGSize constraint = CGSizeMake(300.0f - 2.0f * _margin, 20000.0f);
	UIFont *font = [UIFont systemFontOfSize:_labelFontSize];
	CGSize size = [_description sizeWithFont:font constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
	return MAX(22.0f, size.height);
}

@end
