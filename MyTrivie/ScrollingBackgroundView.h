//
//  ScrollingBackgroundView.h
//  TrivieEnterprise
//
//  Created by Jennifer Duffey on 8/28/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollingBackgroundView : UIView

@property (nonatomic, strong) UIView *backgroundView1, *backgroundView2;
@property (nonatomic, assign) BOOL scrollingStopped;

- (void)startScrolling;
- (void)stopScrolling;

@end
