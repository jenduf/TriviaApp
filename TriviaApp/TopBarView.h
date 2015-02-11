//
//  TopBarView.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopBarView : UIView

@property (nonatomic, assign) TrivieColor trivieColor;

@property (nonatomic, weak) IBOutlet UILabel *points, *score, *timer;

@property (nonatomic, assign) float percent;

@end
