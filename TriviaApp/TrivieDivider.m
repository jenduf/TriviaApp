//
//  TrivieDivider.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/17/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "TrivieDivider.h"

@implementation TrivieDivider

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if(self)
    {
        
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGPoint pointA = CGPointMake(rect.origin.x, 0);
    CGPoint pointB = CGPointMake(rect.origin.x + rect.size.width, 0);
    CGPoint pointC = CGPointMake(rect.origin.x, rect.size.height / 2);
    CGPoint pointD = CGPointMake(rect.origin.x + rect.size.width, rect.size.height / 2);
    
    CGContextSaveGState(context);
    drawStroke(context, pointA, pointB, [[UIColor blackColor] colorWithAlphaComponent:0.25].CGColor, 1.0);
    drawStroke(context, pointC, pointD, [[UIColor whiteColor] colorWithAlphaComponent:0.25].CGColor, 1.0);
    CGContextRestoreGState(context);
}

@end
