//
//  CategoryCardView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/16/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "CategoryCardView.h"

@implementation CategoryCardView

- (void)setCategories:(NSArray *)categories
{
    _categories = categories;
    
    for(CategoryButtonView *buttonView in self.categoryButtons)
    {
        id cat = categories[buttonView.tag];
        
        NSInteger catID;
        NSString *catName;
        
        if([cat isKindOfClass:[GameCategory class]])
        {
            catID = [(GameCategory *)cat categoryID];
            catName = [(GameCategory *)cat categoryName];
        }
        else
        {
            catID = [(GameSubCategory *)cat subCategoryID];
            catName = [(GameSubCategory *)cat subCategoryName];
        }
        
        [buttonView.categoryButton setTitle:catName forState:UIControlStateNormal];
        
        buttonView.categoryButton.tag = catID;
        
        //UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(categoryButtonSelected:)];
        
        //[buttonView addGestureRecognizer:recognizer];
    }
}

- (IBAction)categoryButtonSelected:(id)sender
{
    NSInteger categoryID = [sender tag];

    [self.delegate categoryCardView:self didSelectCategoryID:categoryID];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
