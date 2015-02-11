//
//  User.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/23/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *userID, *userName, *password, *email;
@property (nonatomic, assign) NSInteger avatarID, tokens;

- (void)save;

+ (User *)userWithPFUser:(PFUser *)user;
+ (User *)currentUser;
+ (void)setCurrentUser:(User *)user;
+ (BOOL)isCurrentUser:(User *)user;



@end
