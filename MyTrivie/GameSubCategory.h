//
//  SubCategory.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

@interface GameSubCategory : NSObject

@property (nonatomic, assign) NSInteger subCategoryID;
@property (nonatomic, strong) NSString *subCategoryName;

+ (GameSubCategory *)subCategoryfromPFObject:(PFObject *)object;

@end
