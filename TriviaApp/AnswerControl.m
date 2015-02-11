//
//  AnswerControl.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "AnswerControl.h"
#import "AnswerBorder.h"
#import "NumberButton.h"

@implementation AnswerControl

- (void)setTrivieColor:(TrivieColor)trivieColor
{
    [super setTrivieColor:trivieColor];
    
    [self.answerBorder setTrivieColor:trivieColor];
    [self.numberButton setTrivieColor:trivieColor];
}

- (void)setAnswerState:(AnswerState)answerState
{
    [super setAnswerState:answerState];
    
    [self.answerBorder setAnswerState:answerState];
    [self.numberButton setAnswerState:answerState];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    [self.answerBorder setSelected:selected];
    [self.numberButton setSelected:selected];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    
    [self.answerBorder setHighlighted:highlighted];
}

- (void)animateForState:(AnswerState)state withCompletionBlock:(void (^)())completionBlock
{
    if(state == AnswerStateUnselected)
    {
        [self hideAnswersWithCompletionBlock:^
        {
            [self setAnswerState:state];
            
            completionBlock();
        }];
    }
    else
    {
        if(state == AnswerStateSelectedIncorrect)
        {
            [self animateHesitationWithCompletionBlock:^
            {
                [self setAnswerState:state];
                
                completionBlock();
            }];
        }
        else
        {
            [self performScaleAnimationWithCompletionBlock:^
             {
                 [self setAnswerState:state];
                 
                 completionBlock();
             }];
        }
    }
}

- (void)animateHesitationWithCompletionBlock:(void (^)())completionBlock
{
    [UIView animateWithDuration:1.3 delay:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^
     {
         [self.answerBorder moveBy:CGPointMake(-PADDING, 0)];
     }
     completion:^(BOOL finished)
     {
         completionBlock();
     }];
}

- (void)hideAnswersWithCompletionBlock:(void (^)())completionBlock
{
    [UIView animateWithDuration:1.3 delay:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^
     {
         [self.answerBorder setRight:self.numberButton.right];
     }
     completion:^(BOOL finished)
     {
         completionBlock();
     }];
}

- (void)performScaleAnimationWithCompletionBlock:(void (^)())completionBlock
{
    //   Scale up correct answer
    [UIView animateWithDuration:.25 delay:.75 options:UIViewAnimationOptionCurveEaseIn
                     animations:^
     {
         self.transform = CGAffineTransformScale(self.transform, 1.05, 1.05);
         CGAffineTransform numberTransform = CGAffineTransformScale(self.numberButton.transform, 1.05, 1.05);
         self.numberButton.transform = CGAffineTransformTranslate(numberTransform, -0.1 * self.numberButton.width, 0);
     }
    completion:^(BOOL finished)
     {
         //   Scale down correct answer and switch to correct graphics
         [UIView animateWithDuration:.25 delay:0 options:UIViewAnimationOptionCurveEaseOut
                          animations:^
          {
              self.transform = CGAffineTransformIdentity;
              self.numberButton.transform = CGAffineTransformIdentity;
              
             // self.transform = CGAffineTransformScale(self.transform, 1.0/1.05, 1.0/1.05);
             // CGAffineTransform numberTransform = CGAffineTransformScale(self.numberButton.transform, 1.0/1.05, 1.0/1.05);
             // self.numberButton.transform = CGAffineTransformTranslate(numberTransform, 0.1 * self.numberButton.width, 0);
          }
          completion:^(BOOL fin)
          {
              completionBlock();
          }];
         
     }];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    layer.cornerRadius = ANSWER_CORNER_RADIUS;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}


@end
