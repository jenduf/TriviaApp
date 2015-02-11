//
//  Answer.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/24/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Answer : NSObject

@property (nonatomic, assign) NSInteger answerIndex;
@property (nonatomic, strong) NSString *answerText;

+ (Answer *)answerWithText:(NSString *)text andIndex:(NSInteger)index;

@end
