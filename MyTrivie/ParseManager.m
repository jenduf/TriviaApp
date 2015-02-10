//
//  ParseManager.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "ParseManager.h"

@implementation ParseManager

static ParseManager *sharedManager = nil;

+ (ParseManager *)sharedManager
{
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^
    {
        sharedManager = [[self alloc] init];
    });
    
    return sharedManager;
}

- (id)init
{
    self = [super init];
    
    if(self)
    {
        
    }
    
    return self;
}

- (void)registerNewUser:(PFUser *)user withCompletionBlock:(void (^)())completionBlock
{
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
    {
        if(succeeded)
        {
            completionBlock();
        }
        else
        {
            NSLog(@"Error registering: %@", error.localizedDescription);
        }
    }];
}

- (void)loginUser:(PFUser *)user withCompletionBlock:(void (^)(PFUser *user))completionBlock
{
    [PFUser logInWithUsernameInBackground:user.username password:user.password block:^(PFUser *user, NSError *error)
    {
        if(user)
        {
            completionBlock(user);
        }
        else
        {
            NSLog(@"Error logging in: %@", error.userInfo[@"error"]);
        }
    }];
}

- (void)getCategoriesWithCompletionBlock:(void (^)(NSArray *categories))completionBlock
{
    PFQuery *query = [PFQuery queryWithClassName:PARSE_CATEGORY_KEY];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    {
        if(error)
        {
            NSLog(@"Error getting categories: %@", error.localizedDescription);
        }
        else
        {
            NSMutableArray *categoryArray = [NSMutableArray array];
            
            for(PFObject *object in objects)
            {
                GameCategory *cat = [GameCategory gameCategoryfromPFObject:object];
                
                [self getSubCategoriesForCategory:cat withCompletionBlock:^(GameCategory *updatedCategory)
                {
                    [categoryArray addObject:updatedCategory];
                    
                    if(categoryArray.count == objects.count)
                    {
                        completionBlock(categoryArray);
                    }
                }];
            }
        }
    }];
}

- (void)getSubCategoriesForCategory:(GameCategory *)category withCompletionBlock:(void (^)(GameCategory *updatedCategory))completionBlock
{
    PFQuery *subQuery = [PFQuery queryWithClassName:PARSE_SUBCATEGORY_KEY];
    [subQuery whereKey:@"subCategoryID" containedIn:category.subCategoryIDs];
    [subQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    {
        for(PFObject *object in objects)
        {
            GameSubCategory *subCategory = [GameSubCategory subCategoryfromPFObject:object];
            [category addSubCategory:subCategory];
        }
        
        completionBlock(category);
    }];
}

- (void)startMatchWithCategoryID:(NSInteger)categoryID withCompletionBlock:(void (^)(Match *match))completionBlock
{
    [PFCloud
        callFunctionInBackground:@"startMatch"
        withParameters:@{@"categoryID":@(categoryID)}
        block:^(PFObject *newMatch, NSError *error)
     {
         Match *m = [[Match alloc] initWithPFObject:newMatch];
         
         if(m.matchStatus == MatchStatusWaiting)
         {
           //  m.rounds = [Match getRoundsFromArray:match[@"rounds"]];
             
             completionBlock(m);
         }
         else
         {
            /* NSArray *rounds = match[@"rounds"];
             
             NSMutableArray *allRounds = [NSMutableArray array];
             
             for(PFObject *round in rounds)
             {
                 [round fetchIfNeededInBackgroundWithBlock:^(PFObject *object, NSError *error)
                 {
                     Round *r = [[Round alloc] initWithPFObject:object];
                     [allRounds addObject:r];
                     
                     if([[rounds lastObject] isEqual:round])
                     {
                         m.rounds = allRounds;
                         completionBlock(m);
                     }
                 }];
             }*/
             
             completionBlock(m);
         }
         
        
     }];
}

- (void)getMatchesForUserName:(NSString *)userName withCompletionBlock:(void (^)(NSArray *matches))completionBlock
{
    PFQuery *p1Query = [PFQuery queryWithClassName:PARSE_MATCH_KEY];
    [p1Query whereKey:@"player1" equalTo:[PFUser currentUser]];
    PFQuery *p2Query = [PFQuery queryWithClassName:PARSE_MATCH_KEY];
    [p2Query whereKey:@"player2" equalTo:[PFUser currentUser]];
    PFQuery *jointQuery = [PFQuery orQueryWithSubqueries:@[p1Query, p2Query]];
    [jointQuery includeKey:@"rounds"];
    [jointQuery includeKey:@"questions"];
    [jointQuery includeKey:@"player1"];
    [jointQuery includeKey:@"player2"];
    [jointQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     {
         NSMutableArray *matches = [NSMutableArray array];
         
         for(PFObject *object in objects)
         {
             Match *match = [[Match alloc] initWithPFObject:object];
             [matches addObject:match];
         }
         
         completionBlock(matches);
     }];
}

- (void)getNextRoundForMatchID:(NSString *)matchID withCompletionBlock:(void (^)(Match *match))completionBlock
{
    [PFCloud
     callFunctionInBackground:@"getNextRound"
     withParameters:@{@"matchID":matchID}
     block:^(PFObject *newMatch, NSError *error)
     {
       //  Match *m = [[Match alloc] initWithPFObject:newMatch];
         
         completionBlock(nil);
     }];
}


@end
