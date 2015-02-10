//
//  MenuHeaderView.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuHeaderView : UIView

@property (nonatomic, assign) TrivieColor trivieColor;
@property (nonatomic, strong) UIImage *headerImage;
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, strong) NSString *headerText;

@end
