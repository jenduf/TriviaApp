//
//  Match.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Round;
@interface Match : NSObject

@property (nonatomic, strong) NSArray *rounds, *categories;
@property (nonatomic, strong) NSString *matchID;
@property (nonatomic, assign) NSInteger currentRoundIndex;
@property (nonatomic, strong) User *player1, *player2;
@property (nonatomic, strong) NSString *playerTurn;
@property (nonatomic, assign) MatchStatus matchStatus;
@property (nonatomic, strong) NSDate *lastPlayed;
@property (nonatomic, strong) PFObject *matchObject;

- (id)initWithPFObject:(PFObject *)object;
+ (NSArray *)getRoundsFromArray:(NSArray *)array;

- (User *)getOpponent;
- (Round *)getCurrentRound;
- (BOOL)isPlayerTurn;
- (NSString *)getCategoryNames;

- (void)save;

+ (Match *)currentMatch;
+ (void)setCurrentMatch:(Match *)match;
+ (BOOL)isFinalTrivie;

@end
