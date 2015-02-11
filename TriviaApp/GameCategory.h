//
//  Category.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

@class GameSubCategory;
@interface GameCategory : NSObject

@property (nonatomic, assign) NSInteger categoryID;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) NSMutableArray *subCategories, *subCategoryIDs;

+ (GameCategory *)gameCategoryfromPFObject:(PFObject *)object;
+ (GameCategory *)gameCategoryWithID:(NSInteger)catID andName:(NSString *)categoryName;
- (void)addSubCategory:(GameSubCategory *)subCategory;
- (GameSubCategory *)getSubCategoryByID:(NSInteger)index;

@end
