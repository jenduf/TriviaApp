//
//  User.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/23/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "User.h"

@implementation User

static User *currentUserObject;

+ (User *)userWithPFUser:(PFUser *)user
{
    User *u = [[User alloc] init];
    u.userID = user.objectId;
    u.userName = user.username;
    u.password = user.password;
    u.email = user.email;
    u.avatarID = [user[@"avatarID"] intValue];
    u.tokens = [user[@"tokens"] intValue];
    
    return u;
}

- (void)save
{
    [PFUser currentUser][@"avatarID"] = @(self.avatarID);
    [[PFUser currentUser] saveInBackground];
}

#pragma mark -
#pragma mark Public Method(s)

// Static helper methods
+ (User *)currentUser
{
    return currentUserObject;
}

+ (void)setCurrentUser:(User *)user
{
    currentUserObject = user;
}

+ (BOOL)isCurrentUser:(User *)user
{
    if([user.userID isEqualToString:[User currentUser].userID])
        return YES;
    
    return NO;
}

@end
