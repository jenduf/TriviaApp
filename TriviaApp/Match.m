//
//  Match.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "Match.h"

@implementation Match

static Match *currentMatchObject;

- (id)initWithPFObject:(PFObject *)object
{
    self = [super init];
    
    if(self)
    {
        _matchObject = object;
        
        _matchID = object.objectId;
        
        _matchStatus = [object[@"matchStatus"] intValue];
        _currentRoundIndex = [object[@"currentRoundIndex"] intValue];
        
        _player1 = [User userWithPFUser:object[@"player1"]];
        _player2 = [User userWithPFUser:object[@"player2"]];
        _playerTurn = object[@"playerTurn"];
        _rounds = [Match getRoundsFromArray:object[@"rounds"]];
        _categories = [Match getCategoriesFromArray:object[@"categories"]];
        _lastPlayed = object.updatedAt;
    }
    
    return self;
}

+ (NSArray *)getRoundsFromArray:(NSArray *)array
{
    NSMutableArray *roundArray = [NSMutableArray array];
    
    for(PFObject *obj in array)
    {
        Round *round = [[Round alloc] initWithPFObject:obj];
        [roundArray addObject:round];
    }
    
    return roundArray;
}

+ (NSArray *)getCategoriesFromArray:(NSArray *)array
{
    NSMutableArray *catArray = [NSMutableArray array];
    
    for(NSNumber *catID in array)
    {
        GameCategory *cat = [[CategoryManager sharedManager] getCategoryByIndex:[catID intValue]];
        [catArray addObject:cat];
    }
    
    return catArray;
}

- (void)save
{
    self.matchObject[@"matchStatus"] = @(self.matchStatus);
    self.matchObject[@"currentRoundIndex"] = @(self.currentRoundIndex);
    self.matchObject[@"playerTurn"] = self.playerTurn;
    [self.matchObject saveEventually];
}

- (User *)getOpponent
{
    if([User isCurrentUser:self.player1])
        return self.player2;
    
    return self.player1;
}

- (Round *)getCurrentRound
{
    Round *round = self.rounds[self.currentRoundIndex];
    return round;
}

- (BOOL)isPlayerTurn
{
    if([self.playerTurn isEqualToString:@"player1"])
    {
        if([User isCurrentUser:self.player1])
            return YES;
    }
    else
    {
        if([User isCurrentUser:self.player2])
            return YES;
    }
    
    return NO;
}

- (NSString *)getCategoryNames
{
    GameCategory *cat1 = self.categories[0];
    GameCategory *cat2 = self.categories[1];
    
    NSString *categoryString = [NSString stringWithFormat:@"%@ / %@", cat1.categoryName, cat2.categoryName];
    
    return categoryString;
}

#pragma mark -
#pragma mark Public Method(s)

// Static helper methods
+ (Match *)currentMatch
{
    return currentMatchObject;
}

+ (void)setCurrentMatch:(Match *)match
{
    currentMatchObject = match;
}

+ (BOOL)isFinalTrivie
{
    return ([Match currentMatch].currentRoundIndex >= TOTAL_ROUNDS);
}

@end
