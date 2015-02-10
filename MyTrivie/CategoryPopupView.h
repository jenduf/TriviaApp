//
//  CategoryPopupView.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/24/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CategoryPopupViewDelegate;

@interface CategoryPopupView : UIView

@property (nonatomic, weak) id <CategoryPopupViewDelegate> delegate;

- (id)initWithDelegate:(id)delegate andFrame:(CGRect)frame;
- (void)animateCategorySelection;

@end

@protocol CategoryPopupViewDelegate

- (void)categoryPopUpViewWasDismissed:(CategoryPopupView *)categoryPopupView;

@end