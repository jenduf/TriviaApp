//
//  NumberFlipperView.m
//  Trivie
//
//  Created by Jennifer Duffey on 5/3/12.
//  Copyright (c) 2012 Trivie. All rights reserved.
//

#import "NumberFlipperView.h"
#import "FlipDigitView.h"

@implementation NumberFlipperView

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	
    if (self)
	{

	}
	
	return self;
}

- (void)animate
{
    [self animateToValue:[User currentUser].tokens duration:0.55 completion:^(BOOL finished)
     {
         NSLog(@"Token animation Complete, %ld", (long)[User currentUser].tokens);
     }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
