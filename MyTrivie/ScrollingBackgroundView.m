//
//  ScrollingBackgroundView.m
//  TrivieEnterprise
//
//  Created by Jennifer Duffey on 8/28/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "ScrollingBackgroundView.h"

@implementation ScrollingBackgroundView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {

    }
    
    return self;
}

- (void)startScrolling
{
  //  NSLog(@"scroll frame: %@", NSStringFromCGRect(frame));
    
   // [self setFrame:frame];
    
    [UIView animateWithDuration:0.4 animations:^
     {
         [self setAlpha:1.0];
     }];
    
    if(self.backgroundView1)
    {
        [self.backgroundView1 removeFromSuperview];
        self.backgroundView1 = nil;
    }
    
    self.backgroundView1 = [[UIView alloc] initWithFrame:self.frame];
    self.backgroundView1.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:IMAGE_BACKGROUND_SQUARE]];
    [self addSubview:self.backgroundView1];
    [self.backgroundView1 setTop:0];
    
    if(self.backgroundView2)
    {
        [self.backgroundView2 removeFromSuperview];
        self.backgroundView2 = nil;
    }
    
    self.backgroundView2 = [[UIView alloc] initWithFrame:self.frame];
    self.backgroundView2.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:IMAGE_BACKGROUND_SQUARE]];
    [self addSubview:self.backgroundView2];
    [self.backgroundView2 setTop:self.backgroundView1.bottom];
    
    self.scrollingStopped = NO;
    
    [self scroll];
}

- (void)scroll
{
    if(!self.scrollingStopped)
    {
        [UIView animateWithDuration:20.0 animations:^
        {
            [self.backgroundView1 setBottom:0];
            [self.backgroundView2 setTop:0];
        }
        completion:^(BOOL finished)
        {
            [self.backgroundView1 setTop:self.height];
            
            [UIView animateWithDuration:20.0 animations:^
            {
                [self.backgroundView2 setBottom:0];
                [self.backgroundView1 setTop:0];
            }
            completion:^(BOOL finished)
            {
                [self.backgroundView2 setTop:self.height];
                [self scroll];
            }];
        }];
    }
}

- (void)stopScrolling
{
    self.scrollingStopped = YES;
    
    [UIView animateWithDuration:0.4 animations:^
    {
        [self setAlpha:0.0];
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
