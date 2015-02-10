//
//  Utils.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (NSString *)menuHeaderTextForSection:(NSInteger)sect
{
    NSString *menuText = @"";
    
    switch(sect)
    {
        case 0:
            menuText = SECTION_TITLE_YOUR_TURN;
            break;
            
        case 1:
            menuText = SECTION_TITLE_THEIR_TURN;
            break;
            
        case 2:
            menuText = SECTION_TITLE_FINISHED_GAMES;
            break;
    }
    
    return menuText;
}

+ (UIColor *)fillColorForTrivieColor:(TrivieColor)trivieColor
{
    UIColor *fillColor = [UIColor clearColor];
    
    switch (trivieColor)
    {
        case TrivieColorGreen:
            fillColor = [UIColor colorWithHexString:COLOR_TRIVIE_GREEN];
            break;
            
        case TrivieColorBlue:
            fillColor = [UIColor colorWithHexString:COLOR_TRIVIE_BLUE];
            break;
            
        case TrivieColorPurple:
            fillColor = [UIColor colorWithHexString:COLOR_TRIVIE_PURPLE];
            break;
            
        case TrivieColorYellow:
            fillColor = [UIColor colorWithHexString:COLOR_TRIVIE_YELLOW];
            break;
            
        case TrivieColorOrange:
            fillColor = [UIColor colorWithHexString:COLOR_TRIVIE_ORANGE];
            break;
            
        default:
            fillColor = [UIColor whiteColor];
            break;
    }
    
    return fillColor;
}

+ (UIColor *)lightFillColorForTrivieColor:(TrivieColor)trivieColor
{
    UIColor *lightFillColor = [UIColor clearColor];
    
    switch (trivieColor)
    {
        case TrivieColorBlue:
            lightFillColor = [UIColor colorWithHexString:COLOR_TRIVIE_LIGHT_BLUE];
            break;
            
        case TrivieColorPurple:
            lightFillColor = [UIColor colorWithHexString:COLOR_TRIVIE_LIGHT_PURPLE];
            break;
            
        case TrivieColorYellow:
            lightFillColor = [UIColor colorWithHexString:COLOR_TRIVIE_LIGHT_YELLOW];
            break;
            
        case TrivieColorOrange:
            lightFillColor = [UIColor colorWithHexString:COLOR_TRIVIE_LIGHT_ORANGE];
            break;
            
        default:
            break;
    }
    
    return lightFillColor;
}

+ (UIColor *)selectedFillColorForTrivieColor:(TrivieColor)trivieColor
{
    UIColor *selectedFillColor = [UIColor clearColor];
    
    switch (trivieColor)
    {
        case TrivieColorOrange:
        {
            selectedFillColor = [UIColor colorWithHexString:COLOR_TRIVIE_ORANGE_SELECTED_FILL];
        }
            break;
            
        case TrivieColorBlue:
        {
            selectedFillColor = [UIColor colorWithHexString:COLOR_TRIVIE_BLUE_SELECTED_FILL];
        }
            break;
            
        case TrivieColorPurple:
        {
            selectedFillColor = [UIColor colorWithHexString:COLOR_TRIVIE_PURPLE_SELECTED_FILL];
        }
            break;
            
        case TrivieColorYellow:
        {
            selectedFillColor = [UIColor colorWithHexString:COLOR_TRIVIE_YELLOW_SELECTED_FILL];
        }
            break;
            
        default:
            break;
    }
    
    return selectedFillColor;
}

+ (NSDictionary *)selectedGradientForTrivieColor:(TrivieColor)trivieColor
{
    NSDictionary *selectedGradient;
    
    switch (trivieColor)
    {
        case TrivieColorGreen:
            selectedGradient = @{GRADIENT_COLOR_ONE: [UIColor colorWithHexString:COLOR_TRIVIE_GREEN_HIGHLIGHT_1], GRADIENT_COLOR_TWO: [UIColor colorWithHexString:COLOR_TRIVIE_GREEN_HIGHLIGHT_2]};
            break;
            
        case TrivieColorBlue:
            selectedGradient = @{GRADIENT_COLOR_ONE: [UIColor colorWithHexString:COLOR_TRIVIE_BLUE_HIGHLIGHT_1], GRADIENT_COLOR_TWO: [UIColor colorWithHexString:COLOR_TRIVIE_BLUE_HIGHLIGHT_2]};
            break;
            
        case TrivieColorPurple:
            selectedGradient = @{GRADIENT_COLOR_ONE: [UIColor colorWithHexString:COLOR_TRIVIE_PURPLE_HIGHLIGHT_1], GRADIENT_COLOR_TWO: [UIColor colorWithHexString:COLOR_TRIVIE_PURPLE_HIGHLIGHT_2]};
            break;
            
        default:
            break;
    }
    
    return selectedGradient;
}

+ (UIColor *)backgroundColorForAvatarID:(NSInteger)avatarID
{
    UIColor *backgroundColor = [Utils fillColorForTrivieColor:TrivieColorBlue];
    
    if(avatarID > AVATARS_PER_SECTION)
    {
        backgroundColor = [Utils fillColorForTrivieColor:TrivieColorGreen];
    }
    
    return backgroundColor;
}

+ (NSString *)stringFromDate:(NSDate *)date
{
    NSDateFormatter *shortDateFormatter = [[NSDateFormatter alloc] init];
   // [shortDateFormatter setDateFormat:DATE_FORMAT_STRING];
    [shortDateFormatter setDateStyle:NSDateFormatterShortStyle];
    return [shortDateFormatter stringFromDate:date];
}

@end
