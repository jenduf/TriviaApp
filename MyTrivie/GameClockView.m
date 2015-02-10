//
//  GameClockView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "GameClockView.h"

@implementation GameClockView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, CGSizeMake(0.0, 1.0), 1.5, [UIColor colorWithHexString:COLOR_DARK_STROKE].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(context, 1.5);
    CGContextStrokeEllipseInRect(context, CGRectInset(rect, GAME_CLOCK_STROKE, GAME_CLOCK_STROKE));
    CGContextRestoreGState(context);
    
    UIBezierPath* handsPath = [UIBezierPath bezierPath];
    [handsPath moveToPoint: CGPointMake(8.5, 7.45)];
    [handsPath addCurveToPoint: CGPointMake(8.5, 9.95) controlPoint1: CGPointMake(8.5, 7.45) controlPoint2: CGPointMake(8.5, 8.5)];
    [handsPath addCurveToPoint: CGPointMake(8.5, 12) controlPoint1: CGPointMake(8.5, 10.76) controlPoint2: CGPointMake(8.51, 12.44)];
    [handsPath addCurveToPoint: CGPointMake(9.51, 12) controlPoint1: CGPointMake(8.49, 11.54) controlPoint2: CGPointMake(8.91, 12.04)];
    [handsPath addCurveToPoint: CGPointMake(11.47, 12) controlPoint1: CGPointMake(10.48, 11.93) controlPoint2: CGPointMake(11.47, 12)];
    [handsPath addCurveToPoint: CGPointMake(12.84, 11.57) controlPoint1: CGPointMake(11.47, 12) controlPoint2: CGPointMake(12.48, 12.08)];
    [handsPath addCurveToPoint: CGPointMake(12.84, 10.81) controlPoint1: CGPointMake(13.2, 11.07) controlPoint2: CGPointMake(12.84, 11.42)];
    [handsPath addCurveToPoint: CGPointMake(11.47, 10.39) controlPoint1: CGPointMake(12.84, 10.2) controlPoint2: CGPointMake(11.47, 10.39)];
    [handsPath addLineToPoint: CGPointMake(10.2, 10.39)];
    [handsPath addLineToPoint: CGPointMake(10.2, 7.45)];
    [handsPath addLineToPoint: CGPointMake(10.2, 6.33)];
    [handsPath addCurveToPoint: CGPointMake(9.35, 5.51) controlPoint1: CGPointMake(10.2, 6.33) controlPoint2: CGPointMake(10.06, 5.38)];
    [handsPath addCurveToPoint: CGPointMake(8.5, 6.33) controlPoint1: CGPointMake(8.64, 5.65) controlPoint2: CGPointMake(8.5, 6.33)];
    [handsPath addLineToPoint: CGPointMake(8.5, 7.45)];
    [handsPath closePath];
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, CGSizeMake(0.0, 1.0), 1.0, [UIColor colorWithHexString:COLOR_DARK_STROKE].CGColor);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextAddPath(context, handsPath.CGPath);
    CGContextFillPath(context);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithHexString:COLOR_DARK_STROKE].CGColor);
    CGContextSetLineWidth(context, 0.5);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);

}

@end
