//
//  ViewController.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "LoginViewController.h"
#import "MainMenuViewController.h"
#import "LoginCardView.h"

@interface LoginViewController ()

@property (nonatomic, strong) IBOutletCollection(LoginCardView) NSArray *loginCards;
@property (nonatomic, weak) IBOutlet UIButton *closeButton, *actionButton;
@property (nonatomic, assign) LoginScreen currentScreen;

- (IBAction)login:(id)sender;
- (IBAction)registerNewUser:(id)sender;
- (IBAction)showRegister:(id)sender;
- (IBAction)goBack:(id)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self animateCards];
}

- (void)animateCards
{
    float delay = 0.0;
    float radians = -4;
    
    for(LoginCardView *cardView in self.loginCards)
    {
        //cardView.transform = CGAffineTransformMakeRotation(RADIANS(ANIMATING_VIEW_RADIANS));
        
        cardView.left = self.view.width;
        
        [UIView animateWithDuration:0.25 delay:delay options:0 animations:^
        {
            [cardView centerHorizontallyInSuperView];
            
            if(cardView.tag > LoginScreenLogin)
            {
                [cardView setTransform:CGAffineTransformRotate(cardView.transform, RADIANS(radians))];
            }
        }
        completion:^(BOOL finished)
        {
            
        }];
        
        delay += .1;
        
        if(cardView.tag == LoginScreenRegister)
        {
            radians = 8;
        }
    }
    
    self.currentScreen = LoginScreenLogin;
}

- (void)animateToNextCard:(LoginScreen)newScreen
{
    LoginCardView *oldCardView = (LoginCardView *)self.loginCards[self.currentScreen];
    LoginCardView *newCardView = (LoginCardView *)self.loginCards[newScreen];
    
    BOOL isForward = (newScreen > self.currentScreen);
    float degrees = (isForward ? -ANIMATING_VIEW_RADIANS : ANIMATING_VIEW_RADIANS);
    
    if(isForward)
    {
       // oldCardView.leftConstraint.active = NO;
       // oldCardView.rightConstraint.active = NO;
       // oldCardView.leftConstraint.constant = -oldCardView.width;
        //[self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
        //[self.view setNeedsUpdateConstraints];
        
        [UIView animateWithDuration:0.25 animations:^
         {
             //[oldCardView setRight:-PADDING];
             [oldCardView setTransform:CGAffineTransformTranslate(oldCardView.transform, -(self.view.width * 1.3), 0)];
             [oldCardView setTransform:CGAffineTransformRotate(oldCardView.transform, RADIANS(degrees))];
        
             [newCardView setTransform:CGAffineTransformIdentity];
         }
         completion:^(BOOL finished)
         {
             
         }];
    }
    else
    {
        [UIView animateWithDuration:0.25 animations:^
         {
             //[newCardView centerHorizontallyInSuperView];
             [newCardView setTransform:CGAffineTransformIdentity];
            // [newCardView setTransform:CGAffineTransformRotate(newCardView.transform, RADIANS(degrees))];
        
             [oldCardView setTransform:CGAffineTransformRotate(oldCardView.transform, RADIANS(-4))];
         }
         completion:^(BOOL finished)
        {
           
        }];
    }
    
    float closeAlpha = (newScreen == LoginScreenLogin ? 0 : 1);
    float actionAlpha = (newScreen == LoginScreenLogin ? 1 : 0);
        
    [UIView animateWithDuration:0.25 delay:0.25 options:0 animations:^
    {
        [self.closeButton setAlpha:closeAlpha];
        [self.actionButton setAlpha:actionAlpha];
    }
    completion:^(BOOL finished)
    {
        
    }];
    
    self.currentScreen = newScreen;
}

- (IBAction)login:(id)sender
{
    LoginCardView *cardView = (LoginCardView *)self.loginCards[self.currentScreen];
    
    PFUser *user = [PFUser user];
    user.username = cardView.usernameTF.text;
    user.password = cardView.passwordTF.text;
    
    [[ParseManager sharedManager] loginUser:user withCompletionBlock:^(PFUser *user)
    {
        [self.navController updateUser:user];
        
        for(LoginCardView *cardView in self.loginCards)
        {
            [UIView animateWithDuration:0.25 animations:^
             {
                 [cardView setTransform:CGAffineTransformTranslate(cardView.transform, -(self.view.width * 1.2), 0)];
//                 [cardView setRight:0];
             }
             completion:^(BOOL finished)
             {
                 if(cardView.tag == LoginScreenNone)
                 {
                     //MainMenuViewController *mmvc = [self.storyboard instantiateViewControllerWithIdentifier:MAIN_MENU_VIEW_CONTROLLER];
                     [self.navController navigateToViewControllerWithIdentifier:MAIN_MENU_VIEW_CONTROLLER completion:nil];
                 }
                 
             }];
        }
    }];
}

- (IBAction)registerNewUser:(id)sender
{
    LoginCardView *cardView = (LoginCardView *)self.loginCards[self.currentScreen];
    
    PFUser *user = [PFUser user];
    user.username = cardView.usernameTF.text;
    user.password = cardView.passwordTF.text;
    user.email = cardView.emailTF.text;
    user[@"avatarID"] = @(DEFAULT_AVATAR_ID);
    user[@"tokens"] = @(DEFAULT_TOKENS);
    
    [[ParseManager sharedManager] registerNewUser:user withCompletionBlock:^()
    {
        [self.navController updateUser:user];
        [self.navController navigateToViewControllerWithIdentifier:MAIN_MENU_VIEW_CONTROLLER completion:nil];
    }];
}

- (IBAction)showRegister:(id)sender
{
    [self animateToNextCard:LoginScreenRegister];
}

- (IBAction)goBack:(id)sender
{
    [self animateToNextCard:LoginScreenLogin];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField Delegate Methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self login:nil];
    
    return YES;
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

- (NavigationType)navigationType
{
    return NavigationTypeLeftRight;
}

- (NSString *)title
{
    return @"";
}

@end
