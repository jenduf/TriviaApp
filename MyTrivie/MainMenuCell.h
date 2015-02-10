//
//  MainMenuCell.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TrivieBackgroundView, ProfileImageView;
@interface MainMenuCell : UITableViewCell

@property (nonatomic, weak) IBOutlet TrivieBackgroundView *trivieBackgroundView;
@property (nonatomic, weak) IBOutlet ProfileImageView *profileImageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel, *roundLabel, *categoryLabel, *lastPlayedLabel;
@property (nonatomic, strong) IBOutletCollection(UILabel) NSArray *allLabels;

@property (nonatomic, strong) Match *match;

@end
