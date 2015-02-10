//
//  NavButtonView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "NavButtonView.h"

@implementation NavButtonView


- (void)updateForState:(NavButtonState)buttonState
{
    self.tag = buttonState;
    
    self.navImage.contentMode = UIViewContentModeTop;
    
    switch(buttonState)
    {
        case NavButtonStateNone:
        {
            [self setHidden:YES];
        }
            break;
            
        case NavButtonStateBack:
        {
            [self.navImage setImage:[UIImage imageNamed:IMAGE_BACK_BUTTON]];
            self.navTitle.text = @"";
            self.navImage.contentMode = UIViewContentModeCenter;
        }
            break;
            
        case NavButtonStateProfile:
        {
            [self.navImage setImage:[UIImage imageNamed:IMAGE_PROFILE_BUTTON]];
            self.navTitle.text = TEXT_PROFILE;
        }
            break;
            
        case NavButtonStateSettings:
        {
            [self.navImage setImage:[UIImage imageNamed:IMAGE_SETTINGS_BUTTON]];
            self.navTitle.text = TEXT_SETTINGS;
        }
            break;
            
        case NavButtonStateChat:
        {
            [self.navImage setImage:[UIImage imageNamed:IMAGE_CHAT_BUTTON]];
            self.navTitle.text = TEXT_CHAT;
        }
            break;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
