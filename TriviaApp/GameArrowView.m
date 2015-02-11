//
//  GameArrowView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "GameArrowView.h"

@implementation GameArrowView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIBezierPath* arrowPath = [UIBezierPath bezierPath];
    [arrowPath moveToPoint: CGPointMake(0, ARROW_Y_PADDING)];
    [arrowPath addLineToPoint: CGPointMake(ARROW_X_PADDING, ARROW_Y_PADDING)];
    [arrowPath addLineToPoint: CGPointMake(ARROW_X_PADDING, rect.size.height)];
    [arrowPath addLineToPoint: CGPointMake(ARROW_Y_PADDING, rect.size.height)];
    [arrowPath addLineToPoint: CGPointMake(ARROW_Y_PADDING, ARROW_Y_PADDING)];
    [arrowPath addLineToPoint: CGPointMake(rect.size.width, ARROW_Y_PADDING)];
    [arrowPath addLineToPoint: CGPointMake(CGRectGetMidX(rect), 0)];
    [arrowPath addLineToPoint: CGPointMake(0, ARROW_Y_PADDING)];
    [arrowPath closePath];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    //CGContextSetShadowWithColor(context, CGSizeMake(0.0, 1.0), 1.5, [UIColor TrivieDarkShadow].CGColor);
    CGContextSetFillColorWithColor(context, [[UIColor blackColor] colorWithAlphaComponent:0.2].CGColor);
    CGContextAddPath(context, arrowPath.CGPath);
    CGContextFillPath(context);
    CGContextRestoreGState(context);
}


@end
