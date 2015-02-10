//
//  ProfileBarView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "ProfileBarView.h"
#import "ProfileImageView.h"
#import "NumberFlipperView.h"

@implementation ProfileBarView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if(self)
    {
        self.numberFlipperView = [[NumberFlipperView alloc] initWithDigitCount:TOTAL_TOKEN_DIGITS];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.flipperContainer addSubview:self.numberFlipperView];
    [self.numberFlipperView setFrame:CGRectMake(0, 0, self.flipperContainer.width, self.flipperContainer.height)];
}

- (void)refresh
{
    [self.profileImageView setAvatarID:[User currentUser].avatarID];
    
    [self.numberFlipperView animate];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
