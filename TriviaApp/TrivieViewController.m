//
//  TrivieViewController.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "TrivieViewController.h"

@interface TrivieViewController ()

@end

@implementation TrivieViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)dimScreen:(BOOL)dim
{
    if(dim)
    {
        [UIView animateWithDuration:.3 animations:^(void)
         {
             self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
         }];
    }
    else
    {
        [UIView animateWithDuration:.3 animations:^(void)
         {
             self.view.backgroundColor = [UIColor clearColor];
         }];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ProfileImageView Delegate Methods
- (void)profileImageViewDidRequestShowAvatars:(ProfileImageView *)profileImageView
{
    [self.navController navigateToViewControllerWithIdentifier:AVATAR_VIEW_CONTROLLER completion:nil];
}

#pragma mark -
#pragma mark UITextField Delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(!self.activeTF)
    {
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
        [self.view addGestureRecognizer:tapRecognizer];
    }
    
    self.activeTF =  textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.activeTF = nil;
    
    self.view.gestureRecognizers = nil;
}

- (void)dismissKeyboard:(UIGestureRecognizer *)recognizer
{
    [self.activeTF resignFirstResponder];
}

#pragma mark Navigation Delegate Methods
- (void)didMoveToParentViewController:(UIViewController *)parent
{
    self.navController = (TrivieNavController *)parent;
}

- (void)willMoveToParentViewController:(UIViewController *)parent
{
    self.navController = (TrivieNavController *)parent;
}

#pragma mark - Override methods
- (NSString *)getIdentifier
{
    return NSStringFromClass([self class]);
}

- (BackgroundType)backgroundType
{
    return BackgroundTypeColor;
}

- (NavigationType)navigationType
{
    // OVERRIDE
    NSAssert(NO, @"%@ must have an override for %s", NSStringFromClass([self class]), __PRETTY_FUNCTION__);
    
    return NavigationTypeLeftRight;
}

- (BOOL)showNav
{
    // OVERRIDE
    NSAssert(NO, @"%@ must have an override for %s", NSStringFromClass([self class]), __PRETTY_FUNCTION__);
    
    return YES;
}

- (BOOL)showProfileBar
{
    // OVERRIDE
    NSAssert(NO, @"%@ must have an override for %s", NSStringFromClass([self class]), __PRETTY_FUNCTION__);
    
    return YES;
}

- (NSString *)title
{
    // OVERRIDE
    NSAssert(NO, @"%@ must have an override for %s", NSStringFromClass([self class]), __PRETTY_FUNCTION__);
    
    return @"";
}


@end
