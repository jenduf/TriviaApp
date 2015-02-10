//
//  TrivieNavController.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "TrivieNavController.h"
#import "TrivieViewController.h"
#import "NavBarView.h"
#import "NavButtonView.h"
#import "ProfileBarView.h"
#import "ProfileImageView.h"
#import "ScrollingBackgroundView.h"

@interface TrivieNavController ()

@property (nonatomic, weak) IBOutlet NavBarView *navBarView;
@property (nonatomic, weak) IBOutlet ProfileBarView *profileBarView;
@property (nonatomic, weak) IBOutlet UIView *containerView, *overlayView;
@property (nonatomic, weak) IBOutlet ScrollingBackgroundView *scrollingBackgroundView;

- (IBAction)navButtonSelected:(UIGestureRecognizer *)recognizer;

@end

@implementation TrivieNavController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    TrivieViewController *tvc = segue.destinationViewController;
    [self toggleNav:tvc.showNav];
    [self toggleProfileBar:tvc.showProfileBar];
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)updateUser:(PFUser *)user
{
    [user fetchIfNeededInBackgroundWithBlock:^(PFObject *object, NSError *error)
    {
        NSLog(@"Avatar id: %i", [object[@"avatarID"] intValue]);
        [User setCurrentUser:[User userWithPFUser:(PFUser *)object]];
        
        [self.profileBarView refresh];
    }];
}

- (void)logout
{
    [PFUser logOut];
    
    [self popToRootViewController];
}

- (void)toggleNav:(BOOL)showNav
{
    if(showNav)
    {
        if(self.navBarView.top < 0)
        {
            [self.navBarView setTransform:CGAffineTransformTranslate(self.navBarView.transform, 0, self.navBarView.height)];
            
            [self.containerView setTransform:CGAffineTransformTranslate(self.containerView.transform, 0, self.navBarView.height)];
        }
    }
    else
    {
        if(self.navBarView.top >= 0)
        {
            [self.navBarView setTransform:CGAffineTransformTranslate(self.navBarView.transform, 0, -self.navBarView.height)];
            
            [self.containerView setTransform:CGAffineTransformTranslate(self.containerView.transform, 0, -self.navBarView.height)];
        }
    }
}

- (void)toggleProfileBar:(BOOL)showProfileBar
{
    if(showProfileBar)
    {
        if(self.profileBarView.top >= self.view.height)
        {
            [self.profileBarView setTransform:CGAffineTransformTranslate(self.profileBarView.transform, 0, -self.profileBarView.height)];
            
          //  [self.containerView setTransform:CGAffineTransformTranslate(self.containerView.transform, 0, self.navBarView.height)];
        }
    }
    else
    {
        if(self.profileBarView.bottom <= (self.view.height - 1))
        {
            [self.profileBarView setTransform:CGAffineTransformTranslate(self.profileBarView.transform, 0, self.profileBarView.height)];
            
           // [self.containerView setTransform:CGAffineTransformTranslate(self.containerView.transform, 0, -self.navBarView.height)];
        }
    }
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (IBAction)navButtonSelected:(UIGestureRecognizer *)recognizer
{
    NavButtonView *navButtonView = (NavButtonView *)recognizer.view;
    
    switch (navButtonView.tag)
    {
        case NavButtonStateBack:
            [self popViewController];
            break;
            
        case NavButtonStateProfile:
            [self navigateToViewControllerWithIdentifier:PROFILE_VIEW_CONTROLLER completion:nil];
            break;
            
        default:
            break;
    }
}

#pragma mark -
#pragma mark Controller Push Methods
- (void)showModalViewControllerWithIdentifier:(NSString *)identifier
{
    TrivieViewController *tvc = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    
    [self addChildViewController:tvc];
    
    [self.view addSubview:tvc.view];
    
    tvc.view.size = self.view.size;
    
    tvc.view.left = self.view.width;
    
    tvc.view.alpha = 0.0;
    
    [UIView animateWithDuration:0.3 animations:^
     {
         tvc.view.left = 0;
         tvc.view.alpha = 1.0;
     }
    completion:^(BOOL finished)
     {
         [tvc didMoveToParentViewController:self];
         
         [tvc dimScreen:YES];
     }];
}

- (void)hideModalViewController:(TrivieViewController *)trivieVC
{
    [UIView animateWithDuration:0.3 animations:^
     {
         trivieVC.view.right = 0;
     }
    completion:^(BOOL finished)
     {
         [trivieVC.view removeFromSuperview];
         
         [trivieVC removeFromParentViewController];
     }];
}

- (void)navigateToViewControllerWithIdentifier:(NSString *)identifier completion:(void (^)(void))completion
{
    TrivieViewController *tvc = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    [self navigateToViewController:tvc completion:completion];
}

- (void)navigateToViewController:(TrivieViewController *)newController completion:(void (^)(void))completion
{
    TrivieViewController *currentController = (TrivieViewController *)self.topViewController;
    
    [self addChildViewController:newController];
    
    [self.containerView addSubview:newController.view];
    
    newController.view.size = self.containerView.size;
    
    [newController didMoveToParentViewController:self];
    
    // newController.view.left = self.containerView.width;
    newController.view.bottom = 0;
        
    [UIView animateWithDuration:ANIMATION_DURATION animations:^
     {
         currentController.view.bottom = 0;
     }
    completion:^(BOOL finished)
     {
         [self toggleNav:newController.showNav];
         [self toggleProfileBar:newController.showProfileBar];
         
         [UIView animateWithDuration:ANIMATION_DURATION animations:^
         {
             newController.view.top = 0;
         }
         completion:^(BOOL finished)
         {
             [self.navBarView updateForState:(NavState)newController.view.tag];
             
             if(completion)
                 completion();
         }];
     }];
    
    if(newController.backgroundType != currentController.backgroundType)
    {
        if(newController.backgroundType == BackgroundTypeScrolling)
        {
            [self.scrollingBackgroundView startScrolling];
        }
        else
        {
            [self.scrollingBackgroundView stopScrolling];
        }
    }
    
    NSLog(@"ViewController %@ Added on top of %@ :: Child Views: %lu", newController, currentController, (unsigned long)[self.childViewControllers count]);
}

- (void)showGame
{
    TrivieViewController *currentController = (TrivieViewController *)self.topViewController;
    TrivieViewController *gameController = (TrivieViewController *)[self.storyboard instantiateViewControllerWithIdentifier:GAME_VIEW_CONTROLLER];
    
    [self addChildViewController:gameController];
    
    [self.overlayView addSubview:gameController.view];
    
    self.overlayView.userInteractionEnabled = YES;
    
    gameController.view.size = self.view.size;
    
    [gameController didMoveToParentViewController:self];
    
    [UIView animateWithDuration:0.4 animations:^
     {
         [self.overlayView setAlpha:1.0];
     }
    completion:^(BOOL finished)
     {
         [self.scrollingBackgroundView stopScrolling];
     }];
    
    NSLog(@"ViewController %@ Added on top of %@ :: Child Views: %lu", gameController, currentController, (unsigned long)[self.childViewControllers count]);
}

- (void)hideGame
{
    [UIView animateWithDuration:ANIMATION_DURATION animations:^
    {
        [self.overlayView setAlpha:0.0];
    }
    completion:^(BOOL finished)
    {
        [self.scrollingBackgroundView startScrolling];
        [self popViewController];
    }];
}

#pragma mark -
#pragma mark Controller Pop Methods
- (void)popToRootViewController
{
    while (self.childViewControllers.count > 0)
    {
        [self popViewController:self.topViewController];
    }
    
    [self navigateToViewControllerWithIdentifier:LOGIN_VIEW_CONTROLLER completion:^{
        
    }];
}

- (void)popViewController:(TrivieViewController *)controller
{
    [controller willMoveToParentViewController:nil];
    [controller removeFromParentViewController];
    [controller.view removeFromSuperview];
    
    NSLog(@"ViewController %@ Removed :: Child Views: %lu", controller, (unsigned long)[self.childViewControllers count]);
}

- (void)popViewController
{
    TrivieViewController *viewControllerToRemove = self.topViewController;
    
    [UIView animateWithDuration:ANIMATION_DURATION animations:^
    {
         viewControllerToRemove.view.bottom = 0;
    }
    completion:^(BOOL finished)
    {
         [UIView animateWithDuration:ANIMATION_DURATION animations:^
         {
              self.secondTopViewController.view.top = 0;
         }
         completion:^(BOOL finished)
         {
              [viewControllerToRemove willMoveToParentViewController:nil];
              [viewControllerToRemove.view removeFromSuperview];
              [viewControllerToRemove removeFromParentViewController];
              
              if(finished)
              {
                  [self.topViewController didMoveToParentViewController:self];
                  
                  [self.navBarView updateForState:(NavState)self.topViewController.view.tag];
              }
          }];
     }];
    
    NSLog(@"ViewController %@ Removed :: Child Views: %lu", viewControllerToRemove, (unsigned long)[self.childViewControllers count]);
}

#pragma mark -
#pragma mark Helper Methods
- (BOOL)isTopViewController:(NSString *)identifier
{
    NSString *currentIdentifier = self.topViewController.getIdentifier;
    
    return [currentIdentifier isEqualToString:identifier];
}

- (TrivieViewController *)topViewController
{
    return [self.childViewControllers lastObject];
}

- (TrivieViewController *)secondTopViewController
{
    if(self.childViewControllers.count < 2)
        return nil;
    
    return self.childViewControllers[(self.childViewControllers.count - 2)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
