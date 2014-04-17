#import "UILabel+Resizing.h"

@implementation UILabel (Resizing)


- (void)sizeToFitVertically {
	
	CGSize size = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(self.frame.size.width, 1000) lineBreakMode:self.lineBreakMode];
	CGRect _frame = self.frame;
	_frame.size.height = size.height;
	self.frame = _frame;
}

- (void)sizeToFitHorizontally {
	
	CGSize size = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(320, self.frame.size.height) lineBreakMode:self.lineBreakMode];
	CGRect _frame = self.frame;
	_frame.size.width = size.width;
	self.frame = _frame;
}

@end
