//
//  ProfileBarView.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NumberFlipperView, ProfileImageView;
@interface ProfileBarView : UIView

@property (nonatomic, weak) IBOutlet ProfileImageView *profileImageView;
@property (nonatomic, weak) IBOutlet UIView *flipperContainer;
@property (nonatomic, strong) NumberFlipperView *numberFlipperView;

- (void)refresh;

@end
