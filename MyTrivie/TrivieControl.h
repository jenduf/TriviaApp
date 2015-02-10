//
//  TrivieButton.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/24/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrivieControl : UIControl

@property (nonatomic, assign) TrivieColor trivieColor;
@property (nonatomic, strong) UIColor *strokeColor, *fillColor;
@property (nonatomic, assign) AnswerState answerState;

@end
