//
//  Round.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/27/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Round : NSObject

@property (nonatomic, strong) PFObject *roundObject;
@property (nonatomic, assign) NSInteger roundIndex;
@property (nonatomic, assign) NSInteger categoryID;
@property (nonatomic, strong) NSArray *questions;
@property (nonatomic, strong) NSMutableArray *player1Answers, *player2Answers;

- (instancetype)initWithPFObject:(PFObject *)object;

- (void)addAnswer:(NSInteger)answer;

+ (Round *)currentRound;
+ (void)setCurrentRound:(Round *)round;

@end
