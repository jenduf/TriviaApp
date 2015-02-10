//
//  ParseManager.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParseManager : NSObject

- (void)registerNewUser:(PFUser *)user withCompletionBlock:(void (^)())completionBlock;
- (void)loginUser:(PFUser *)user withCompletionBlock:(void (^)(PFUser *user))completionBlock;
- (void)getCategoriesWithCompletionBlock:(void (^)(NSArray *categories))completionBlock;
- (void)startMatchWithCategoryID:(NSInteger)categoryID withCompletionBlock:(void (^)(Match *match))completionBlock;
- (void)getMatchesForUserName:(NSString *)userName withCompletionBlock:(void (^)(NSArray *matches))completionBlock;
- (void)getNextRoundForMatchID:(NSString *)matchID withCompletionBlock:(void (^)(Match *match))completionBlock;

+ (ParseManager *)sharedManager;

@end
