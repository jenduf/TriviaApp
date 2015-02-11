//
//  AnswerBorder.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "AnswerBorder.h"

@implementation AnswerBorder

- (void)setTrivieColor:(TrivieColor)trivieColor
{
    [super setTrivieColor:trivieColor];
    
    [self setStrokeColor:[Utils fillColorForTrivieColor:trivieColor]];
    
    [self setFillColor:[UIColor colorWithHexString:COLOR_GAME_ANSWER_FILL]];
}

- (void)setAnswerState:(AnswerState)answerState
{
    [super setAnswerState:answerState];
    
    switch (answerState)
    {
        case AnswerStateNone:
        case AnswerStateUnselected:
            
            break;
            
        case AnswerStateSelectedCorrect:
        case AnswerStateUnselectedCorrect:
        {
            [self setFillColor:[UIColor colorWithHexString:COLOR_FILL_CORRECT]];
            [self setStrokeColor:[UIColor colorWithHexString:COLOR_STROKE_CORRECT]];
        }
            break;
            
        case AnswerStateSelectedIncorrect:
        {
            [self setFillColor:[UIColor colorWithHexString:COLOR_FILL_INCORRECT]];
            [self setStrokeColor:[UIColor colorWithHexString:COLOR_STROKE_INCORRECT]];
        }
            break;
            
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    if(selected)
    {
        [self setFillColor:[Utils selectedFillColorForTrivieColor:self.trivieColor]];
    }
    
    [self setNeedsDisplay];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    
    if(highlighted)
    {
        [self setFillColor:[Utils fillColorForTrivieColor:self.trivieColor]];
    }
    
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, 2, 0) cornerRadius:8.0];
    
    CGContextSaveGState(context);
    
    CGContextAddPath(context, path.CGPath);
    
    CGContextClip(context);
    
    CGContextAddPath(context, path.CGPath);
    
    CGContextSetStrokeColorWithColor(context, self.strokeColor.CGColor);
    
    CGContextSetFillColorWithColor(context, self.fillColor.CGColor);
    
    CGContextSetLineWidth(context, GAME_ANSWER_STROKE_WIDTH);
    
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextRestoreGState(context);
}


@end
