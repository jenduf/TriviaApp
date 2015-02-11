//
//  CategoryManager.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/16/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "CategoryManager.h"
#import "GameCategory.h"
#import "GameSubCategory.h"

@implementation CategoryManager

static CategoryManager *sharedManager = nil;

+ (CategoryManager *)sharedManager
{
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^
    {
        sharedManager = [[self alloc] init];
    });
    
    return sharedManager;
}

- (id)init
{
    self = [super init];
    
    if(self)
    {
        self.categoryList = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)loadCategories
{
    [[ParseManager sharedManager] getCategoriesWithCompletionBlock:^(NSArray *categories)
    {
        [self.categoryList removeAllObjects];
        
        [self.categoryList addObjectsFromArray:categories];
    }];
}

- (void)setSelectedCategoryIndex:(NSInteger)selectedCategoryIndex
{
    _selectedCategoryIndex = selectedCategoryIndex;
    
    GameCategoryType catType = [self getCategoryTypeByIndex:selectedCategoryIndex];
    
    if(catType == GameCategoryTypeCategory)
    {
        GameCategory *cat = [self getCategoryByIndex:selectedCategoryIndex];
        
        [self setSelectedCategoryName:cat.categoryName];
    }
    else
    {
        GameCategory *cat = [self getCategoryBySubCategoryIndex:selectedCategoryIndex];
        
        GameSubCategory *subCat = [cat getSubCategoryByID:selectedCategoryIndex];
        
        [self setSelectedCategoryName:subCat.subCategoryName];
    }
}

- (GameCategoryType)getCategoryTypeByIndex:(NSInteger)index
{
    if([self getCategoryByIndex:index] != nil)
        return GameCategoryTypeCategory;
    
    return GameCategoryTypeSubCategory;
}

- (NSInteger)getCategoryIndexFromIndex:(NSInteger)index
{
    if([self getCategoryTypeByIndex:index] == GameCategoryTypeCategory)
        return index;
    
    GameCategory *cat = [self getCategoryBySubCategoryIndex:index];
    
    return cat.categoryID;
}

- (GameCategory *)getCategoryByIndex:(NSInteger)index
{
    if(index == RANDOM_CATEGORY_ID)
    {
        return [GameCategory gameCategoryWithID:RANDOM_CATEGORY_ID andName:RANDOM_CATEGORY_STRING];
    }
    
    for(GameCategory *cat in self.categoryList)
    {
        if(cat.categoryID == index)
            return cat;
    }
    
    return nil;
}

- (GameCategory *)getCategoryBySubCategoryIndex:(NSInteger)index
{
    for(GameCategory *cat in self.categoryList)
    {
        if([cat getSubCategoryByID:index] != nil)
            return cat;
    }
    
    return nil;
}

- (NSArray *)getRandomCategoriesWithPercentage:(float)percent
{
    NSMutableArray *returnArray = [NSMutableArray array];
    
    if(!self.shuffledCategoryList)
    {
        self.shuffledCategoryList = [[NSMutableArray alloc] initWithArray:self.categoryList];
    }
    else if(self.shuffledCategoryList.count < TOTAL_CATEGORY_CARD_OPTIONS)
    {
        [self.shuffledCategoryList removeAllObjects];
        [self.shuffledCategoryList addObjectsFromArray:self.categoryList];
    }
    
    // get random mix based on percentage
    BOOL subCategoryInTheMix = NO;
    
    for(NSInteger i = 0; i < TOTAL_CATEGORY_CARD_OPTIONS; i++)
    {
        GameCategory *category = (GameCategory *)[self.shuffledCategoryList randomObject];
        
        NSInteger randomIndex = arc4random() % 100;
        NSInteger convertedPercent = percent * 100;
        
        if(randomIndex > convertedPercent || (i == (TOTAL_CATEGORY_CARD_OPTIONS - 1) && subCategoryInTheMix == NO))
        {
            subCategoryInTheMix = YES;
            
            GameSubCategory *subCat = [category.subCategories randomObject];
            
            if([returnArray containsObject:subCat])
            {
                subCat = [category.subCategories randomObject];
            }
            
            if(subCat)
            {
                [returnArray addObject:subCat];
            }
        }
        else
        {
            if(category)
            {
                [returnArray addObject:category];
            }
        }
        
        if(category)
        {
            [self.shuffledCategoryList removeObject:category];
        }
    }
    
    return returnArray;
}

@end
