//
//  PowerUpCardView.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/17/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "GameCreationCardView.h"
#import "AnimatedImageView.h"

@protocol PowerUpCardViewDelegate;

@interface PowerUpCardView : GameCreationCardView
<AnimatedImageViewDelegate>

@property (nonatomic, weak) IBOutlet UIImageView *powerUpBackgroundView;

@property (nonatomic, weak) IBOutlet AnimatedImageView *powerUpImageView;

@property (nonatomic, weak) IBOutlet UILabel *categoryLabel;
@property (nonatomic, weak) IBOutlet UILabel *roundLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;

@property (nonatomic, strong) IBOutletCollection(UIButton) NSArray *powerUpButtons, *selectedPowerUpButtons;

@property (nonatomic, assign) PowerUpType selectedPowerUp;

@property (nonatomic, weak) IBOutlet id <PowerUpCardViewDelegate> delegate;

- (IBAction)powerUpButtonSelected:(id)sender;
- (IBAction)playPoweredUp:(id)sender;
- (IBAction)playFree:(id)sender;

@end

@protocol PowerUpCardViewDelegate

- (void)powerUpCardView:(PowerUpCardView *)powerUpCardView didSelectPowerUpType:(PowerUpType)powerUpType;

@end
