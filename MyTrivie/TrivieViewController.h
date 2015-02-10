//
//  TrivieViewController.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileImageView.h"

@interface TrivieViewController : UIViewController
<UITextFieldDelegate, ProfileImageViewDelegate>

@property (nonatomic, strong) UITextField *activeTF;
@property (nonatomic, strong) TrivieNavController *navController;

- (void)dimScreen:(BOOL)dim;

- (NSString *)getIdentifier;
- (BOOL)showNav;
- (BOOL)showProfileBar;
- (BackgroundType)backgroundType;
- (NavigationType)navigationType;
- (NSString *)title;

@end
