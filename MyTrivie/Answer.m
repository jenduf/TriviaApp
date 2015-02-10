//
//  Answer.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/24/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "Answer.h"

@implementation Answer

+ (Answer *)answerWithText:(NSString *)text andIndex:(NSInteger)index
{
    Answer *answer = [[Answer alloc] init];
    answer.answerText = text;
    answer.answerIndex = index;
    
    return answer;
}

@end
