//
//  NavBarView.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NavButtonView;
@interface NavBarView : UIView

@property (nonatomic, weak) IBOutlet NavButtonView *leftButtonView, *rightButtonView;

- (void)updateForState:(NavState)navState;

@end
