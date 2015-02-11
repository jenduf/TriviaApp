//
//  GameStarView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "GameStarView.h"

@implementation GameStarView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// Star Drawing
    UIBezierPath* starPath = [UIBezierPath bezierPath];
    [starPath moveToPoint: CGPointMake(8, -0)];
    [starPath addLineToPoint: CGPointMake(5.18, 4.12)];
    [starPath addLineToPoint: CGPointMake(0.39, 5.53)];
    [starPath addLineToPoint: CGPointMake(3.43, 9.48)];
    [starPath addLineToPoint: CGPointMake(3.3, 14.47)];
    [starPath addLineToPoint: CGPointMake(8, 12.8)];
    [starPath addLineToPoint: CGPointMake(12.7, 14.47)];
    [starPath addLineToPoint: CGPointMake(12.57, 9.48)];
    [starPath addLineToPoint: CGPointMake(15.61, 5.53)];
    [starPath addLineToPoint: CGPointMake(10.82, 4.12)];
    [starPath closePath];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, CGSizeMake(0.0, 1.0), 1.5, [UIColor colorWithHexString:COLOR_DARK_STROKE].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(context, 1.0);
    CGContextAddPath(context, starPath.CGPath);
    CGContextFillPath(context);
    CGContextRestoreGState(context);
}


@end
