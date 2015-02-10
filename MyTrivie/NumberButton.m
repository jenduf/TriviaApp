//
//  NumberButton.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "NumberButton.h"

@implementation NumberButton

- (void)setTrivieColor:(TrivieColor)trivieColor
{
    [super setTrivieColor:trivieColor];
    
    [self setFillColor:[Utils fillColorForTrivieColor:self.trivieColor]];
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
            [self setFillColor:[UIColor colorWithHexString:COLOR_STROKE_CORRECT]];
        }
            break;
            
        case AnswerStateSelectedIncorrect:
        {
            [self setFillColor:[UIColor colorWithHexString:COLOR_STROKE_INCORRECT]];
        }
            break;
            
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:8.0];
    
    CGContextSaveGState(context);
    
    CGContextAddPath(context, path.CGPath);
    
    CGContextSetFillColorWithColor(context,self.fillColor.CGColor);
    
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextRestoreGState(context);
}

@end
