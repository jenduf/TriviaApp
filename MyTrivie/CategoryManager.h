//
//  CategoryManager.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/16/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GameCategory;
@interface CategoryManager : NSObject

@property (nonatomic, strong) NSMutableArray *categoryList, *shuffledCategoryList;

@property (nonatomic, strong) NSString *selectedCategoryName;
@property (nonatomic, assign) NSInteger selectedCategoryIndex;

- (void)loadCategories;
- (NSArray *)getRandomCategoriesWithPercentage:(float)percent;
- (GameCategoryType)getCategoryTypeByIndex:(NSInteger)index;
- (GameCategory *)getCategoryByIndex:(NSInteger)index;
- (NSInteger)getCategoryIndexFromIndex:(NSInteger)index;

+ (CategoryManager *)sharedManager;

@end
