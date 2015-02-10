//
//  TopBarView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "TopBarView.h"

@implementation TopBarView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if(self)
    {
        self.percent = 1.0;
    }
    
    return self;
}

- (void)setTrivieColor:(TrivieColor)trivieColor
{
    _trivieColor = trivieColor;
    
    [self setNeedsDisplay];
}

- (void)setPercent:(float)percent
{
    _percent = percent;
    
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    float percentWidth = rect.size.width * self.percent;
    
    CGRect percentRect = CGRectMake(0, 0, percentWidth, rect.size.height);
    CGPathRef percentPath = createRoundedRectForRect(percentRect, 0.0);
    
    CGRect leftOverRect = CGRectMake(percentWidth, 0, rect.size.width - percentWidth, rect.size.height);
    CGPathRef leftOverPath = createRoundedRectForRect(leftOverRect, 0.0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *fillColor = [Utils fillColorForTrivieColor:self.trivieColor];
    
    drawClippedBackground(context, percentPath, rect, fillColor.CGColor, 0.2);
    
    UIColor *lightFillColor = [Utils lightFillColorForTrivieColor:self.trivieColor];
    
    drawClippedBackground(context, leftOverPath, rect, lightFillColor.CGColor, 0.15);
}


@end
