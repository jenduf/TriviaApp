//
//  AvatarCell.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/23/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "AvatarCell.h"
#import "ProfileImageView.h"

@implementation AvatarCell

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    //[self.profileImageView setNeedsDisplay];
}

- (void)setAvatarID:(NSInteger)avatarID
{
    _avatarID = avatarID;
    
    [self.profileImageView setAvatarID:avatarID];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    [self.profileImageView setSelected:selected];
}

@end
