//
//  GameStatusViewController.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 2/9/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "GameStatusViewController.h"

@interface GameStatusViewController ()

@property (nonatomic, weak) IBOutlet UILabel *categoryName;

@end

@implementation GameStatusViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.categoryName.text = [[Match currentMatch] getCategoryNames];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
