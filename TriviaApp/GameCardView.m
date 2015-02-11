//
//  GameCardView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "GameCardView.h"
#import "TopBarView.h"
#import "AnswerControl.h"
#import "GameContentView.h"
#import "GameOverlayView.h"

@implementation GameCardView

- (id)initWithDelegate:(id)delegate andFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        UIView * v = [[[NSBundle mainBundle] loadNibNamed:GAME_CARD_VIEW owner:self options:nil] lastObject];
        [self addSubview:v];
        
        self.delegate = delegate;
        
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(overlayTapped:)];
        [self.gameOverlayView addGestureRecognizer:tapRecognizer];
    }
    
    return self;
}

- (void)setCurrentQuestion:(Question *)currentQuestion
{
    _currentQuestion = currentQuestion;
    
    [self.gameContentView setCurrentQuestion:currentQuestion];
    
    [self.gameOverlayView setCurrentQuestion:currentQuestion];
}

- (void)setRemainingTime:(float)remainingTime
{
    _remainingTime = remainingTime;
    
    float percentLeft = (float)remainingTime / (float)TOTAL_QUESTION_TIME;
    [self.gameContentView.topBarView setPercent:percentLeft];
}


- (void)overlayTapped:(UIGestureRecognizer *)recognizer
{
    [UIView animateWithDuration:0.4 animations:^
     {
         [self.gameOverlayView setBottom:self.gameOverlayView.top];
     }
    completion:^(BOOL finished)
     {
         [self.delegate gameCardViewDidBeginQuestion:self];
     }];
}

- (IBAction)answerSelected:(id)sender
{
    AnswerControl *aControl = (AnswerControl *)sender;
    [aControl setSelected:YES];
    
    [self.gameContentView setSelectedIndex:aControl.tag];
    
    [self.delegate gameCardViewDidEndQuestion:self withSelectedIndex:aControl.tag];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
