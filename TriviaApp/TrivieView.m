//
//  TrivieView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/24/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "TrivieView.h"

@implementation TrivieView

- (void)setTrivieColor:(TrivieColor)trivieColor
{
    _trivieColor = trivieColor;
}

- (void)setStrokeColor:(UIColor *)strokeColor
{
    _strokeColor = strokeColor;
    
    [self setNeedsDisplay];
}

- (void)setFillColor:(UIColor *)fillColor
{
    _fillColor = fillColor;
    
    [self setNeedsDisplay];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
