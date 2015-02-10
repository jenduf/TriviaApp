//
//  TrivieNavController.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TrivieViewController;
@interface TrivieNavController : UIViewController

- (void)updateUser:(PFUser *)user;
- (void)showModalViewControllerWithIdentifier:(NSString *)identifier;
- (void)hideModalViewController:(TrivieViewController *)trivieVC;
- (void)navigateToViewControllerWithIdentifier:(NSString *)identifier completion:(void (^)(void))completion;
- (void)navigateToViewController:(TrivieViewController *)newController completion:(void (^)(void))completion;
- (void)popViewController;
- (void)showGame;
- (void)hideGame;
- (void)logout;

@end
