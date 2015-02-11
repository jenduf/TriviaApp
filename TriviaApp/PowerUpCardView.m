//
//  PowerUpCardView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/17/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "PowerUpCardView.h"
#import "AnimatedImageView.h"

@implementation PowerUpCardView

// OVERRIDE
- (void)didAppear
{
    self.categoryLabel.text = [CategoryManager sharedManager].selectedCategoryName;
    
    [self animatePowerUp];
}

- (void)didDisappear
{
    [self.powerUpImageView stopPlaying];
}

- (void)animatePowerUp
{
    if(self.powerUpImageView.isPlaying)
        [self.powerUpImageView stopPlaying];
    
    /*
    NSInteger total = [self getAnimationCount];
    
    NSMutableArray *animatedImages = [NSMutableArray array];
    
    for(NSInteger i = 0; i < total; i++)
    {
        NSString *imageName = [NSString stringWithFormat:@"powerup_animation_%ld_%ld", (long)self.selectedPowerUp, (long)i];
        [animatedImages addObject:[UIImage imageNamed:imageName]];
    }*/
    
    BOOL isAutoReverse  = NO;
    
    if(self.selectedPowerUp == PowerUpTypeSecondChance)
    {
        isAutoReverse = YES;
    }
    
    NSString *imageName = [NSString stringWithFormat:@"%@%ld", IMAGE_POWERUP_ANIMATION, (long)self.selectedPowerUp];
    
    [self.powerUpImageView startPlayingImageName:imageName totalImages:[self getAnimationCount] frames:2.0 autoReverse:isAutoReverse autoRepeat:YES andDelegate:self];
}

- (NSInteger)getAnimationCount
{
    NSInteger animationCount = 0;
    
    switch(self.selectedPowerUp)
    {
        case 0:
            animationCount = TOTAL_HYPERDRIVE_ANIMATION_IMAGES;
            break;
            
        case 1:
            animationCount = TOTAL_SECOND_CHANCE_ANIMATION_IMAGES;
            break;
            
        case 2:
            animationCount = TOTAL_STREAKER_ANIMATION_IMAGES;
            break;
    }
    
    return animationCount;
}

- (IBAction)powerUpButtonSelected:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    PowerUpType newSelectedPowerUp = (PowerUpType)btn.tag;
    
    if(self.selectedPowerUp != btn.tag)
    {
        UIButton *selectedButton = self.selectedPowerUpButtons[newSelectedPowerUp];
        UIButton *previousButton = self.powerUpButtons[self.selectedPowerUp];
        UIButton *previousSelectedButton = self.selectedPowerUpButtons[self.selectedPowerUp];
        [UIView animateWithDuration:0.25 animations:^
        {
            [btn setAlpha:0.0];
            [previousSelectedButton setAlpha:0.0];
            [previousButton setAlpha:1.0];
            [selectedButton setAlpha:1.0];
        }];
        
        NSString *backgroundName = [NSString stringWithFormat:@"powerup_bg_selected_%ld", (long)newSelectedPowerUp];
        self.powerUpBackgroundView.image = [UIImage imageNamed:backgroundName];
        
        self.selectedPowerUp = newSelectedPowerUp;
        
        [self animatePowerUp];
    }
}

- (IBAction)playPoweredUp:(id)sender
{
    [self.delegate powerUpCardView:self didSelectPowerUpType:self.selectedPowerUp];
}

- (IBAction)playFree:(id)sender
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - Animated Image View Delegate
- (void)imageView:(AnimatedImageView *)animatedImageView didStartAnimation:(NSString *)animationName
{
    
}

- (void)imageView:(AnimatedImageView *)animatedImageView didPauseAnimation:(NSString *)animationName
{
    [self.powerUpImageView resumePlaying];
}

- (void)imageView:(AnimatedImageView *)animatedImageView didFinishAnimation:(NSString *)animationName
{
    
}

@end
