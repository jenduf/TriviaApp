//
//  Utils.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+ (NSString *)menuHeaderTextForSection:(NSInteger)sect;
+ (UIColor *)fillColorForTrivieColor:(TrivieColor)trivieColor;
+ (UIColor *)lightFillColorForTrivieColor:(TrivieColor)trivieColor;
+ (UIColor *)selectedFillColorForTrivieColor:(TrivieColor)trivieColor;
+ (NSDictionary *)selectedGradientForTrivieColor:(TrivieColor)trivieColor;
+ (UIColor *)backgroundColorForAvatarID:(NSInteger)avatarID;
+ (NSString *)stringFromDate:(NSDate *)date;

@end
