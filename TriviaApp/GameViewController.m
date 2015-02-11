//
//  GameViewController.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/18/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "GameViewController.h"
#import "GameCardView.h"
#import "GameOverlayView.h"
#import "FinalTrivieCardView.h"
#import "Round.h"

@interface GameViewController ()
<GameCardViewDelegate>

@property (nonatomic, strong) GameCardView *currentGameCard;
@property (nonatomic, assign) NSInteger currentQuestionIndex;
@property (nonatomic, strong) NSTimer *gameTimer;
@property (nonatomic, assign) float remainingTime;

@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
  //  self.view.backgroundColor = [self.view.backgroundColor colorWithAlphaComponent:0.5];
    
    // initialize timer
    
    [Round setCurrentRound:[[Match currentMatch] getCurrentRound]];
    
    [self prepareNextGameCard];
}

- (void)prepareNextGameCard
{
    if([Match isFinalTrivie])
    {
        
    }
    else
    {
        NSArray *questions = [Round currentRound].questions;
    
        if(self.currentQuestionIndex < questions.count)
        {
            Question *question = questions[self.currentQuestionIndex];
            
            self.remainingTime = TOTAL_QUESTION_TIME;
            
            self.currentGameCard = [[GameCardView alloc] initWithDelegate:self andFrame:self.view.frame];
            
            [self.currentGameCard setCurrentQuestion:question];
            
            [self.view addSubview:self.currentGameCard];
            
            [self.currentGameCard setOrigin:CGPointMake(self.view.width, -self.view.height)];
            
            [UIView animateWithDuration:0.4 animations:^
            {
                [self.currentGameCard setOrigin:CGPointMake(CARD_BORDER_WIDTH, 0)];
            }
            completion:^(BOOL finished)
            {
                
            }];
            
            self.currentQuestionIndex++;
        }
        else
        {
            [self exitGame];
        }
    }
}

- (void)exitGame
{
    Match *match = [Match currentMatch];
    if([match.playerTurn isEqualToString:@"player1"])
    {
        match.playerTurn = @"player2";
        [match save];
    }
    else
    {
        if([Round currentRound].roundIndex < TOTAL_ROUNDS)
        {
            [[ParseManager sharedManager] getNextRoundForMatchID:[Match currentMatch].matchID withCompletionBlock:^(Match *match)
             {
            
             }];
        }
        
        //match.playerTurn = @"player1";
        //match.currentRoundIndex++;
        //[match save];
    }
    
    [self.navController hideGame];//popViewControllerWithNavType:NavigationTypeLeftRight];
}

- (void)timeTick:(NSTimer *)timer
{
    if(self.remainingTime > 0)
        self.remainingTime--;
    
    [self.currentGameCard setRemainingTime:self.remainingTime];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Game Card View Delegate Methods
- (void)gameCardViewDidBeginQuestion:(GameCardView *)cardView
{
    self.gameTimer = [NSTimer scheduledTimerWithTimeInterval:(0.5) target:self selector:@selector(timeTick:) userInfo:nil repeats:YES];
}

- (void)gameCardViewDidEndQuestion:(GameCardView *)cardView withSelectedIndex:(NSInteger)selectedIndex
{
    [self.gameTimer invalidate];
    
    [[Round currentRound] addAnswer:selectedIndex];
    
    [UIView animateWithDuration:0.4 delay:2.2 options:UIViewAnimationOptionBeginFromCurrentState animations:^
    {
        self.currentGameCard.transform = CGAffineTransformTranslate(self.currentGameCard.transform, -self.view.width, 0);
     //   [self.currentGameCard setRight:0];
    }
    completion:^(BOOL finished)
    {
        [self prepareNextGameCard];
    }];
}

#pragma mark - Super Methods to Override
- (BOOL)showNav
{
    return NO;
}

- (BOOL)showProfileBar
{
    return YES;
}

- (BackgroundType)backgroundType
{
    return BackgroundTypeGame;
}

- (NSString *)title
{
    return @"";
}

@end
