//
//  Round.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/27/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "Round.h"

@implementation Round

static Round *currentRoundObject;

- (instancetype)initWithPFObject:(PFObject *)object
{
    if(self)
    {
        _roundObject = object;
        _roundIndex = [object[@"roundID"] intValue];
        _categoryID = [object[@"categoryID"] intValue];
        _questions = [Round getQuestionsFromArray:object[@"questions"]];
        _player1Answers = object[@"player1_answers"];
        
        if(_player1Answers && _player1Answers.count == TOTAL_QUESTIONS_PER_ROUND)
        {
            _player2Answers = [[NSMutableArray alloc] init];
        }
        else
        {
            _player1Answers = [[NSMutableArray alloc] init];
        }
    }
    
    return self;
}

+ (NSArray *)getQuestionsFromArray:(NSArray *)array
{
    NSMutableArray *questionArray = [NSMutableArray array];
    
    NSInteger total = array.count;
    for(NSInteger i = 0; i < total; i++)
    {
        PFObject *obj = array[i];
        [obj fetchIfNeeded];
    //    [questionArray addObject:obj];
        Question *question = [Question questionfromPFObject:obj atIndex:(i + 1)];
        [questionArray addObject:question];
    }
    
    return questionArray;
}

- (void)addAnswer:(NSInteger)answer
{
    if(self.player2Answers)
    {
        [self.player2Answers addObject:@(answer)];
        self.roundObject[@"player2_answers"] = self.player2Answers;
    }
    else
    {
        [self.player1Answers addObject:@(answer)];
        self.roundObject[@"player1_answers"] = self.player1Answers;
    }
    
    [self.roundObject saveEventually];
}

// Static helper methods
+ (Round *)currentRound
{
    return currentRoundObject;
}

+ (void)setCurrentRound:(Round *)round
{
    currentRoundObject = round;
}

@end
