//
//  IntroViewController.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 2/1/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "IntroViewController.h"
#import "AnimatedImageView.h"

@interface IntroViewController ()
<AnimatedImageViewDelegate>

@property (nonatomic, weak) IBOutlet AnimatedImageView *animatedImageView;

@end

@implementation IntroViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.animatedImageView startPlayingImageName:IMAGE_INTRO totalImages:TOTAL_INTRO_ANIMATION_IMAGES frames:2.0 autoReverse:NO autoRepeat:NO andDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AnimatedImageView Delegate Methods
- (void)imageView:(AnimatedImageView *)animatedImageView didFinishAnimation:(NSString *)animationName
{
    NSLog(@"Animation finished");
}

- (void)imageView:(AnimatedImageView *)animatedImageView didStartAnimation:(NSString *)animationName
{
    NSLog(@"Animation started");
}

- (void)imageView:(AnimatedImageView *)animatedImageView didPauseAnimation:(NSString *)animationName
{
    NSLog(@"Animation paused");
    
    PFUser *user = [PFUser currentUser];
    
    NSLog(@"Avatar id: %ld", (long)user[@"avatarID"]);
    
    if(user)
    {
        [User setCurrentUser:[User userWithPFUser:user]];
        
        [self.navController updateUser:user];
        [self.navController navigateToViewControllerWithIdentifier:MAIN_MENU_VIEW_CONTROLLER completion:nil];
    }
    else
    {
        [self.navController navigateToViewControllerWithIdentifier:LOGIN_VIEW_CONTROLLER completion:nil];
    }
}

#pragma mark - Super Methods to Override
- (BOOL)showNav
{
    return NO;
}

- (BOOL)showProfileBar
{
    return NO;
}

- (BackgroundType)backgroundType
{
    return BackgroundTypeNone;
}

- (NavigationType)navigationType
{
    return NavigationTypeLeftRight;
}

- (NSString *)title
{
    return @"";
}

@end
