//
//  FinalTrivieCardView.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 2/9/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "FinalTrivieCardView.h"
#import "GameOverlayView.h"

@implementation FinalTrivieCardView

- (id)initWithDelegate:(id)delegate andFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        UIView * v = [[[NSBundle mainBundle] loadNibNamed:FINAL_TRIVIE_VIEW owner:self options:nil] lastObject];
        [self addSubview:v];
        
        self.delegate = delegate;
        
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(overlayTapped:)];
        [self.gameOverlayView addGestureRecognizer:tapRecognizer];
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
