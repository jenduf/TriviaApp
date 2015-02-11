//
//  AvatarCell.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/23/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProfileImageView;
@interface AvatarCell : UICollectionViewCell

@property (nonatomic, assign) NSInteger avatarID;

@property (nonatomic, weak) IBOutlet ProfileImageView *profileImageView;

@end
