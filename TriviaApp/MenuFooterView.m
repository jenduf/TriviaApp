//
//  MenuFooterView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "MenuFooterView.h"

@implementation MenuFooterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)setTrivieColor:(TrivieColor)trivieColor
{
    _trivieColor = trivieColor;
    
    self.fillColor = [Utils fillColorForTrivieColor:trivieColor];
    
    if(trivieColor < TrivieColorPurple)
    {
        self.nextBackgroundColor = [Utils fillColorForTrivieColor:(trivieColor + 1)];
    }
    else
    {
        self.nextBackgroundColor = [UIColor whiteColor];
    }
    
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    drawTrivieBackground(context, rect, self.nextBackgroundColor, YES, 0);
    
    // circle
    CGRect ovalRect = CGRectMake((self.width - MENU_ARC_WIDTH) / 2, -MENU_ARC_HEIGHT, MENU_ARC_WIDTH, MENU_ARC_HEIGHT);
    UIBezierPath *ovalPath = [UIBezierPath bezierPath];
    
    [ovalPath addArcWithCenter: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)) radius: CGRectGetWidth(ovalRect) / 2 startAngle: 0 * M_PI/180 endAngle: 180 * M_PI/180 clockwise: YES];
    [ovalPath addLineToPoint: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect))];
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 4, [[UIColor colorWithHexString:COLOR_DARK_STROKE] colorWithAlphaComponent:0.3].CGColor);
    CGContextSetFillColorWithColor(context, self.fillColor.CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithHexString:COLOR_DARK_STROKE].CGColor);
    CGContextSetLineWidth(context, 1);
    CGContextAddPath(context, ovalPath.CGPath);
    CGContextDrawPath(context, kCGPathFillStroke);
    CGContextRestoreGState(context);
}


@end
