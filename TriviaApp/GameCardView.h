//
//  GameCardView.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GameCardViewDelegate;

@class GameContentView, GameOverlayView, Question;
@interface GameCardView : UIView

@property (nonatomic, weak) IBOutlet GameOverlayView *gameOverlayView;
@property (nonatomic, weak) IBOutlet GameContentView *gameContentView;
@property (nonatomic, strong) Question *currentQuestion;
@property (nonatomic, assign) float remainingTime;

@property (nonatomic, weak) id <GameCardViewDelegate> delegate;

- (id)initWithDelegate:(id)delegate andFrame:(CGRect)frame;

- (IBAction)answerSelected:(id)sender;

- (void)overlayTapped:(UIGestureRecognizer *)recognizer;

@end

@protocol GameCardViewDelegate

- (void)gameCardViewDidBeginQuestion:(GameCardView *)cardView;
- (void)gameCardViewDidEndQuestion:(GameCardView *)cardView withSelectedIndex:(NSInteger)selectedIndex;

@end