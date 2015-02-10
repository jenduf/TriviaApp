//
//  ProfileImageView.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProfileImageViewDelegate;

@interface ProfileImageView : UIView

@property (nonatomic, assign) NSInteger cornerRadius;

@property (nonatomic, assign) NSInteger avatarID;

@property (nonatomic, assign) BOOL selected;

@property (nonatomic, weak) IBOutlet id <ProfileImageViewDelegate> delegate;

@end

@protocol ProfileImageViewDelegate

- (void)profileImageViewDidRequestShowAvatars:(ProfileImageView *)profileImageView;

@end