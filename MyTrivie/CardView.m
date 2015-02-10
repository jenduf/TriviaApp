//
//  CardView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "CardView.h"

@implementation CardView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if(self)
    {
        [self setCardBackgroundColor:self.backgroundColor];
        
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)setCardBackgroundColor:(UIColor *)cardBackgroundColor
{
    _cardBackgroundColor = cardBackgroundColor;
    
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
    
    CGRect cardRect = CGRectInset(rect, CARD_BORDER_WIDTH, CARD_BORDER_WIDTH);
    UIBezierPath *cardPath = [UIBezierPath bezierPathWithRect:cardRect];
    
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, self.cardBackgroundColor.CGColor);
    CGContextAddPath(context, cardPath.CGPath);
    CGContextClip(context);
    CGContextAddPath(context, cardPath.CGPath);
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context);
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 3, [UIColor blackColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(context, CARD_BORDER_WIDTH);
    CGContextAddPath(context, path.CGPath);
    CGContextAddPath(context, cardPath.CGPath);
    CGContextEOClip(context);
    CGContextAddPath(context, cardPath.CGPath);
    CGContextDrawPath(context, kCGPathStroke);
    CGContextRestoreGState(context);
}

@end
