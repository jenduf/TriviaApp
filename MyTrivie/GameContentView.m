//
//  GameContentView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "GameContentView.h"
#import "TopBarView.h"
#import "AnswerControl.h"
#import "AnswerBorder.h"
#import "NumberButton.h"
#import "Answer.h"

@implementation GameContentView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if(self)
    {
        
    }
    
    return self;
}

- (void)setRoundIndex:(NSInteger)roundIndex
{
    
    
    /*for(AnswerControl *answer in self.answers)
    {
        [answer setTrivieColor:roundIndex];
    }*/
}

- (void)setCurrentQuestion:(Question *)currentQuestion
{
    _currentQuestion = currentQuestion;
    
    self.questionText.text = currentQuestion.questionText;
    
    NSMutableArray *shuffledAnswers = (NSMutableArray *)[currentQuestion.answers shuffledArray];
    
    for(AnswerControl *answer in self.answers)
    {
        Answer *a = (Answer *)shuffledAnswers[0];
        answer.answerBorder.answerText.text = a.answerText;
        [answer setTrivieColor:(TrivieColor)answer.tag];
        answer.tag = a.answerIndex;
        
        [shuffledAnswers removeObjectAtIndex:0];
    }
    
    NSInteger fixedIndex = currentQuestion.questionIndex + 1;
    
    [self.topBarView setTrivieColor:(TrivieColor)fixedIndex];
}                       

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    _selectedIndex = selectedIndex;
    
    for(AnswerControl *ac in self.answers)
    {
        AnswerState state = [self getAnswerStateForControlIndex:ac.tag];
        
        [ac animateForState:state withCompletionBlock:^
        {
            
        }];
    }
}

- (AnswerState)getAnswerStateForControlIndex:(NSInteger)index
{
    AnswerState answerState;
    
    if(index == self.currentQuestion.correctIndex)
    {
        if(index == self.selectedIndex)
            answerState = AnswerStateSelectedCorrect;
        else
            answerState = AnswerStateUnselectedCorrect;
    }
    else
    {
        if(index == self.selectedIndex)
            answerState = AnswerStateSelectedIncorrect;
        else
            answerState = AnswerStateUnselected;
    }
    
    return answerState;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
