//
//  NavButtonView.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavButtonView : UIView

@property (nonatomic, weak) IBOutlet UILabel *navTitle;
@property (nonatomic, weak) IBOutlet UIImageView *navImage;

- (void)updateForState:(NavButtonState)state;

@end
