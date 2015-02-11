//
//  CategoryPopupView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/24/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "CategoryPopupView.h"
#import "TrivieCircleView.h"

@implementation CategoryPopupView

- (id)initWithDelegate:(id)delegate andFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        self.delegate = delegate;
    }
    
    return self;
}

- (void)animateCategorySelection
{
    TrivieCircleView *greenView = [[TrivieCircleView alloc] initWithColor:[UIColor colorWithHexString:COLOR_TRIVIE_CHART] andFrame:CGRectMake(0, 0, CIRCLE_SIZE * CIRCLE_LARGE_MULTIPLIER, CIRCLE_SIZE * CIRCLE_LARGE_MULTIPLIER)];
    [self addSubview:greenView];
    [greenView centerHorizontallyAbove:self];
    
    TrivieCircleView *blackView = [[TrivieCircleView alloc] initWithColor:[UIColor blackColor] andFrame:CGRectMake(0, 0, CIRCLE_SIZE * CIRCLE_MEDIUM_MULTIPLIER, CIRCLE_SIZE * CIRCLE_MEDIUM_MULTIPLIER)];
    [self addSubview:blackView];
    [blackView centerHorizontallyAbove:self];
    
    TrivieCircleView *orangeView = [[TrivieCircleView alloc] initWithColor:[UIColor colorWithHexString:COLOR_TRIVIE_ORANGE] andFrame:CGRectMake(0, 0, CIRCLE_SIZE, CIRCLE_SIZE)];
    [self addSubview:orangeView];
    [orangeView centerHorizontallyAbove:self];
    
    UIImage *ribbonImage = [UIImage imageNamed:IMAGE_CATEGORY_RIBBON];
    UIImageView *ribbonImageView = [[UIImageView alloc] initWithImage:ribbonImage];
    [self addSubview:ribbonImageView];
    [ribbonImageView centerHorizontallyAbove:self];
    
    UILabel *categoryLabel = [[UILabel alloc] initWithFrame:ribbonImageView.frame];
    categoryLabel.font = [UIFont fontWithName:FONT_MUSEO_700 size:FONT_SIZE_CATEGORY];
    categoryLabel.textAlignment = NSTextAlignmentCenter;
    categoryLabel.textColor = [UIColor colorWithHexString:COLOR_DARK_STROKE];
    categoryLabel.backgroundColor = [UIColor clearColor];
    categoryLabel.text = [CategoryManager sharedManager].selectedCategoryName;
    [ribbonImageView addSubview:categoryLabel];
    //[categoryLabel sizeToFit];
    [categoryLabel centerInSuperView];
    categoryLabel.transform = CGAffineTransformMakeRotation(RADIANS(-5));
    
    NSInteger categoryIndex = [[CategoryManager sharedManager] getCategoryIndexFromIndex:[CategoryManager sharedManager].selectedCategoryIndex];
    NSString *categoryImageName = [NSString stringWithFormat:@"%@_%ld", IMAGE_GAME_CARD_ICON, (long)categoryIndex];
    UIImage *categoryImage = [UIImage imageNamed:categoryImageName];
    UIImageView *categoryImageView = [[UIImageView alloc] initWithImage:categoryImage];
    [self addSubview:categoryImageView];
    [categoryImageView setSize:CGSizeMake(categoryImage.size.width * 0.8, categoryImage.size.height * 0.8)];
    [categoryImageView centerHorizontallyAbove:self];
    
    UILabel *myCatLabel = [[UILabel alloc] initWithFrame:self.frame];
    myCatLabel.font = [UIFont fontWithName:FONT_MUSEO_700 size:FONT_SIZE_CATEGORY_HEADER];
    myCatLabel.textAlignment = NSTextAlignmentCenter;
    myCatLabel.textColor = [UIColor whiteColor];
    myCatLabel.backgroundColor = [UIColor clearColor];
    myCatLabel.text = MY_CATEGORY_STRING;
    [self addSubview:myCatLabel];
    [myCatLabel sizeToFit];
    [myCatLabel centerHorizontallyInSuperView];
    [myCatLabel setTop:(self.height / 4)];
    myCatLabel.transform = CGAffineTransformScale(myCatLabel.transform, 0, 0);
    
    UILabel *roundLabel = [[UILabel alloc] initWithFrame:self.frame];
    roundLabel.font = [UIFont fontWithName:FONT_MUSEO_700 size:FONT_SIZE_CATEGORY_TYPE];
    roundLabel.textAlignment = NSTextAlignmentCenter;
    roundLabel.textColor = [UIColor whiteColor];
    roundLabel.backgroundColor = [UIColor clearColor];
    roundLabel.text = CATEGORY_ROUND_STRING;
    [self addSubview:roundLabel];
    [roundLabel sizeToFit];
    [roundLabel centerHorizontallyInSuperView];
    [roundLabel setTop:(self.height / 2 + CATEGORY_BUTTON_PADDING)];
    roundLabel.transform = CGAffineTransformScale(roundLabel.transform, 0, 0);
    
    UIImage *buttonImage = [UIImage imageNamed:IMAGE_CHART_BUTTON];
    UIButton *okButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [okButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [okButton setTitle:GOT_IT_STRING forState:UIControlStateNormal];
    [okButton.titleLabel setFont:[UIFont fontWithName:FONT_MUSEO_700 size:FONT_SIZE_CATEGORY_BUTTON]];
    [okButton.titleLabel setTextColor:[UIColor blackColor]];
    [okButton setSize:buttonImage.size];
    [self addSubview:okButton];
    [okButton centerHorizontallyInSuperView];
    [okButton setTop:(roundLabel.bottom + PADDING)];
    okButton.transform = CGAffineTransformScale(okButton.transform, 0, 0);
    [okButton addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    
    [UIView animateWithDuration:0.4 animations:^
    {
        [self setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.85]];
    }];
    
    [UIView animateWithDuration:0.4 delay:0.1 options:0 animations:^
    {
        [greenView centerInSuperView];
    }
    completion:^(BOOL finished)
    {
        
    }];
    
    [UIView animateWithDuration:0.4 delay:0.2 options:0 animations:^
     {
         [blackView centerInSuperView];
     }
    completion:^(BOOL finished)
     {
         
     }];
    
    [UIView animateWithDuration:0.4 delay:0.3 options:0 animations:^
     {
         [orangeView centerInSuperView];
     }
    completion:^(BOOL finished)
     {
         
     }];
    
    [UIView animateWithDuration:0.4 delay:0.4 options:0 animations:^
     {
         [ribbonImageView setCenter:CGPointMake(self.center.x, self.center.y + POPUP_RIBBON_PADDING)];
         [categoryLabel moveBy:CGPointMake(0, -POPUP_PADDING_TOP)];
         [categoryImageView setBottom:ribbonImageView.top];
     }
    completion:^(BOOL finished)
     {
         [UIView animateWithDuration:0.4 animations:^
         {
             [myCatLabel setTransform:CGAffineTransformIdentity];
             [okButton setTransform:CGAffineTransformIdentity];
             [roundLabel setTransform:CGAffineTransformIdentity];
         }];
     }];
}

- (IBAction)close:(id)sender
{
    [UIView animateWithDuration:0.4 animations:^
    {
        [self setAlpha:0.0];
    }
    completion:^(BOOL finished)
    {
        [self removeFromSuperview];
        
        [self.delegate categoryPopUpViewWasDismissed:self];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
