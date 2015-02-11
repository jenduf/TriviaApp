//
//  AnswerControl.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrivieControl.h"

@class AnswerBorder, NumberButton;
@interface AnswerControl : TrivieControl

@property (nonatomic, weak) IBOutlet AnswerBorder *answerBorder;
@property (nonatomic, weak) IBOutlet NumberButton *numberButton;

- (void)animateForState:(AnswerState)state withCompletionBlock:(void (^)())completionBlock;

@end
