//
//  TrivieCircleView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/24/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "TrivieCircleView.h"

@implementation TrivieCircleView

- (id)initWithColor:(UIColor *)fillColor andFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        self.backgroundColor = [UIColor clearColor];
        [self setFillColor:fillColor];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect circleRect = CGRectMake(POPUP_PADDING_TOP, POPUP_PADDING_TOP, rect.size.width - POPUP_PADDING_BOTTOM, rect.size.height - POPUP_PADDING_BOTTOM);
    
    CGRect strokeRect = CGRectMake(POPUP_PADDING_TOP, POPUP_PADDING_TOP, rect.size.width - POPUP_PADDING_BOTTOM, rect.size.height - POPUP_PADDING_BOTTOM - 2);
    
    CGContextSaveGState(context);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(context, 1.0);
    CGContextStrokeEllipseInRect(context, strokeRect);
    CGContextRestoreGState(context);
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 2, [UIColor colorWithHexString:COLOR_DARK_STROKE].CGColor);
    CGContextSetFillColorWithColor(context, self.fillColor.CGColor);
    CGContextFillEllipseInRect(context, circleRect);
    CGContextRestoreGState(context);
}

@end
