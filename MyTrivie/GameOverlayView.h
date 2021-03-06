//
//  GameOverlayView.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TrivieBackgroundView, Question;
@interface GameOverlayView : UIView

@property (nonatomic, weak) IBOutlet TrivieBackgroundView *trivieBackgroundView;
@property (nonatomic, weak) IBOutlet UIImageView *bottomImageView, *categoryIcon;
@property (nonatomic, weak) IBOutlet UILabel *category, *round, *questionNumber, *points;
@property (nonatomic, strong) Question *currentQuestion;


@end