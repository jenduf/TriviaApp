//
//  MainMenuCell.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "MainMenuCell.h"
#import "TrivieBackgroundView.h"
#import "ProfileImageView.h"

@implementation MainMenuCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setTag:(NSInteger)tag
{
    [super setTag:tag];
    
    [self.trivieBackgroundView setTrivieColor:(TrivieColor)(tag + 1)];
    
    UIColor *textColor;
    
    switch(tag)
    {
        case 0:
        {
            textColor = [UIColor colorWithHexString:COLOR_TRIVIE_GREEN_TEXT];
        }
            break;
            
        case 1:
        {
            textColor = [UIColor colorWithHexString:COLOR_TRIVIE_BLUE_TEXT];
        }
            break;
            
        case 2:
        {
            textColor = [UIColor colorWithHexString:COLOR_TRIVIE_PURPLE_TEXT];
        }
            break;
    }
    
    for(UILabel *label in self.allLabels)
    {
        [label setTextColor:textColor];
    }
}

- (void)setMatch:(Match *)match
{
    _match = match;
    
    User *opponent = [match getOpponent];
    self.nameLabel.text = (opponent.userName ? opponent.userName : TEXT_WAITING_FOR_PLAYER);
    [self.profileImageView setAvatarID:opponent.avatarID];
    
    self.roundLabel.text = [NSString stringWithFormat:@"Round %ld", (long)(match.currentRoundIndex + 1)];
    self.categoryLabel.text = [match getCategoryNames];
    self.lastPlayedLabel.text = [match.lastPlayed prettyDate];//[Utils stringFromDate:match.lastPlayed];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
