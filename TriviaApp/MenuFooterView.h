//
//  MenuFooterView.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrivieBackgroundView.h"

@interface MenuFooterView : UIView

@property (nonatomic, assign) TrivieColor trivieColor;
@property (nonatomic, strong) UIColor *fillColor, *nextBackgroundColor;

@end
