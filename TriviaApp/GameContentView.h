//
//  GameContentView.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TopBarView, AnswerControl, Question;
@interface GameContentView : UIView

@property (nonatomic, weak) IBOutlet TopBarView *topBarView;
@property (nonatomic, strong) IBOutletCollection(AnswerControl) NSArray *answers;
@property (nonatomic, weak) IBOutlet UILabel *questionText;
@property (nonatomic, strong) Question *currentQuestion;
@property (nonatomic, assign) NSInteger selectedIndex;

- (void)setRoundIndex:(NSInteger)roundIndex;

@end