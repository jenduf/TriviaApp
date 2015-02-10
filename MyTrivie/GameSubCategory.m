//
//  SubCategory.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "GameSubCategory.h"

@implementation GameSubCategory

+ (GameSubCategory *)subCategoryfromPFObject:(PFObject *)object
{
    GameSubCategory *subCategory = [[GameSubCategory alloc] init];
    subCategory.subCategoryID = [object[@"subCategoryID"] intValue];
    subCategory.subCategoryName = object[@"subCategoryName"];
    
    return subCategory;
}

@end
