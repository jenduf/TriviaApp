//
//  CategoryCardView.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/16/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryButtonView.h"

@protocol CategoryCardViewDelegate;

@interface CategoryCardView : UIView

@property (nonatomic, strong) IBOutletCollection(CategoryButtonView) NSArray *categoryButtons;
@property (nonatomic, strong) NSArray *categories;

@property (nonatomic, weak) IBOutlet id <CategoryCardViewDelegate> delegate;

- (IBAction)categoryButtonSelected:(id)sender;

@end

@protocol CategoryCardViewDelegate

- (void)categoryCardView:(CategoryCardView *)categoryCardView didSelectCategoryID:(NSInteger)categoryID;

@end