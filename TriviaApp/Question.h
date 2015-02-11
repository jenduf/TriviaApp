//
//  Question.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic, strong) PFObject *questionObject;
@property (nonatomic, assign) NSInteger categoryID, questionIndex, correctIndex, selectedIndex;
@property (nonatomic, strong) NSString *categoryName, *questionText, *factoid;
@property (nonatomic, strong) NSArray *answers;

+ (Question *)questionfromPFObject:(PFObject *)object atIndex:(NSInteger)index;

@end
