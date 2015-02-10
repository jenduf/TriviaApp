//
//  Question.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "Question.h"
#import "Answer.h"

@implementation Question

+ (Question *)questionfromPFObject:(PFObject *)object atIndex:(NSInteger)index
{
    Question *question = [[Question alloc] init];
    question.questionObject = object;
    question.categoryID = [object[@"categoryID"] intValue];
    question.categoryName = object[@"categoryName"];
    question.questionText = object[@"questionText"];
    question.answers = [[NSArray alloc] initWithArray:[Question createAnswersFromArray:object[@"answers"]]];
    question.correctIndex = [object[@"correctIndex"] intValue];
    question.questionIndex = index;
    question.factoid = object[@"factoid"];
    
    return question;
}

+ (NSArray *)createAnswersFromArray:(NSArray *)array
{
    NSMutableArray *answerArray = [NSMutableArray array];
    
    NSInteger total = array.count;
    
    for(NSInteger i = 0; i < total; i++)
    {
        NSString *text = array[i];
        Answer *answer = [Answer answerWithText:text andIndex:i];
        [answerArray addObject:answer];
    }
    
    return answerArray;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    _selectedIndex = selectedIndex;
    
    self.questionObject[@"selectedIndex"] = @(selectedIndex);
    
    [self.questionObject saveEventually];
}

@end
