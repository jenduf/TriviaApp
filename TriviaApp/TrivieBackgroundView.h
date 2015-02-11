//
//  TrivieBackgroundView.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrivieBackgroundView : UIView

@property (nonatomic, assign) BOOL showBorder, showShadow, isHighlighted;

@property (nonatomic, assign) TrivieColor trivieColor;

@property (nonatomic, assign) NSInteger colorIndex;

@property (nonatomic, strong) UIColor *fillColor;

@property (nonatomic, strong) NSDictionary *selectedFillGradient;

@property (nonatomic, strong) UIView *footerView;

@end
