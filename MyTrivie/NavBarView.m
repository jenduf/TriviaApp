//
//  NavBarView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "NavBarView.h"
#import "NavButtonView.h"

@implementation NavBarView

- (void)updateForState:(NavState)navState
{
    switch(navState)
    {
        case NavStateProfile:
        {
            [self.leftButtonView updateForState:NavButtonStateBack];
            [self.rightButtonView updateForState:NavButtonStateSettings];
        }
            break;
            
        case NavStateMainMenu:
        {
            [self.leftButtonView updateForState:NavButtonStateSettings];
            [self.rightButtonView updateForState:NavButtonStateProfile];
        }
            break;
            
        case NavStateGameStatus:
        {
            [self.leftButtonView updateForState:NavButtonStateBack];
            [self.rightButtonView updateForState:NavButtonStateChat];
        }
            break;
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    drawTrivieBackground(context, rect, [UIColor whiteColor], YES, rect.size.height - 1);
}

@end
