//
//  ProfileViewController.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/23/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@property (nonatomic, weak) IBOutlet ProfileImageView *profileImageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;

- (IBAction)logOut:(id)sender;

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.profileImageView setAvatarID:[User currentUser].avatarID];
    
    self.nameLabel.text = [User currentUser].userName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logOut:(id)sender
{
    [self.navController logout];
}

#pragma mark - Super Methods to Override
- (BOOL)showNav
{
    return YES;
}

- (BOOL)showProfileBar
{
    return YES;
}

- (BackgroundType)backgroundType
{
    return BackgroundTypeScrolling;
}

- (NavigationType)navigationType
{
    return NavigationTypeUpDown;
}

- (NSString *)title
{
    return @"";
}

@end
