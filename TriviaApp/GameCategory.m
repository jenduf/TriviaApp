//
//  Category.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "GameCategory.h"
#import "GameSubCategory.h"

@implementation GameCategory

+ (GameCategory *)gameCategoryfromPFObject:(PFObject *)object
{
    GameCategory *gameCategory = [[GameCategory alloc] init];
    gameCategory.categoryID = [object[@"categoryID"] intValue];
    gameCategory.categoryName = object[@"categoryName"];
    gameCategory.subCategoryIDs = object[@"subCategories"];
    gameCategory.subCategories = [[NSMutableArray alloc] init];
    
    return gameCategory;
}

+ (GameCategory *)gameCategoryWithID:(NSInteger)catID andName:(NSString *)categoryName
{
    GameCategory *gameCategory = [[GameCategory alloc] init];
    gameCategory.categoryID = catID;
    gameCategory.categoryName = categoryName;
    
    return gameCategory;
}

- (void)addSubCategory:(GameSubCategory *)subCategory
{
    [self.subCategories addObject:subCategory];
}

- (GameSubCategory *)getSubCategoryByID:(NSInteger)index
{
    for(GameSubCategory *sub in self.subCategories)
    {
        if(sub.subCategoryID == index)
        {
            return sub;
        }
    }
    
    return nil;
}

@end
