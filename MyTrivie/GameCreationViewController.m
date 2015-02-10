//
//  GameCreationViewController.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/16/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "GameCreationViewController.h"
#import "GameCreationCardView.h"
#import "CategoryCardView.h"
#import "PowerUpCardView.h"
#import "CategoryPopupView.h"
#import "Round.h"

@interface GameCreationViewController ()
<CategoryCardViewDelegate, PowerUpCardViewDelegate, CategoryPopupViewDelegate>

@property (nonatomic, strong) IBOutletCollection(GameCreationCardView) NSArray *gameCards;
@property (nonatomic, weak) IBOutlet CategoryCardView *categoryCardView;
@property (nonatomic, weak) IBOutlet UIButton *closeButton;
@property (nonatomic, assign) GameCreationScreen currentScreen;

- (IBAction)goBack:(id)sender;

@end

@implementation GameCreationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self animateCards];
}

- (void)animateCards
{
    float delay = 0.0;
    float radians = -4;
    
    for(GameCreationCardView *cardView in self.gameCards)
    {
        //cardView.transform = CGAffineTransformMakeRotation(RADIANS(ANIMATING_VIEW_RADIANS));
        
        cardView.left = self.view.width;
        
        [UIView animateWithDuration:0.25 delay:delay options:0 animations:^
         {
             [cardView centerHorizontallyInSuperView];
             
             if(cardView.tag > 0)
             {
                 [cardView setTransform:CGAffineTransformRotate(cardView.transform, RADIANS(radians))];
             }
         }
        completion:^(BOOL finished)
         {
             
         }];
        
        if(cardView.tag % 2 == 0)
        {
            radians = -4;
        }
        else
        {
            radians = 6;
        }
        
        delay += .1;
    }
    
    [self getRandomCategories];
}

- (void)animateToScreen:(GameCreationScreen)newScreen
{
    GameCreationCardView *oldCardView = (GameCreationCardView *)self.gameCards[self.currentScreen];
    GameCreationCardView *newCardView = (GameCreationCardView *)self.gameCards[newScreen];
    
    BOOL isForward = (newScreen > self.currentScreen);
    
    if(isForward)
    {
        [UIView animateWithDuration:0.25 animations:^
         {
             //[oldCardView setRight:-PADDING];
             [oldCardView setTransform:CGAffineTransformTranslate(oldCardView.transform, -(self.view.width * 1.3), 0)];
             [oldCardView setTransform:CGAffineTransformRotate(oldCardView.transform, RADIANS(-ANIMATING_VIEW_RADIANS))];
             
             [newCardView setTransform:CGAffineTransformIdentity];
         }
        completion:^(BOOL finished)
         {
             [UIView animateWithDuration:0.2 animations:^
              {
                  [self.closeButton setAlpha:1.0];
              }];
             
             [newCardView didAppear];
         }];
    }
    else
    {
        [UIView animateWithDuration:0.25 animations:^
         {
             [newCardView setTransform:CGAffineTransformIdentity];
             
             [oldCardView setTransform:CGAffineTransformRotate(oldCardView.transform, RADIANS(-4))];
         }
        completion:^(BOOL finished)
         {
             [UIView animateWithDuration:0.2 animations:^
              {
                  [self.closeButton setAlpha:0.0];
              }];
         }];
    }
    
    self.currentScreen = newScreen;
}

- (void)getRandomCategories
{
    NSArray *categories = [[CategoryManager sharedManager] getRandomCategoriesWithPercentage:0.4];
    
    if(categories && categories.count > 0)
    {
        [self.categoryCardView setCategories:categories];
    }
}

- (IBAction)goBack:(id)sender
{
    [self animateToScreen:GameCreationScreenSelectCategory];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Category Pop Up View Delegate Methods
- (void)categoryPopUpViewWasDismissed:(CategoryPopupView *)categoryPopupView
{
    [self animateToScreen:GameCreationScreenPowerUp];
}

#pragma mark - Category Card View Delegate Methods
- (void)categoryCardView:(CategoryCardView *)categoryCardView didSelectCategoryID:(NSInteger)categoryID
{
    [[CategoryManager sharedManager] setSelectedCategoryIndex:categoryID];
    
    CategoryPopupView *popupView = [[CategoryPopupView alloc] initWithDelegate:self andFrame:CGRectMake(0, POPUP_TOP_SPACE, self.view.width, self.view.height)];
    [self.view addSubview:popupView];
    [popupView centerInSuperView];
    
    [popupView animateCategorySelection];
}

#pragma mark - PowerUp Card View Delegate Methods
- (void)powerUpCardView:(PowerUpCardView *)powerUpCardView didSelectPowerUpType:(PowerUpType)powerUpType
{
    NSInteger catIndex = [[CategoryManager sharedManager] getCategoryIndexFromIndex:[CategoryManager sharedManager].selectedCategoryIndex];
    [[ParseManager sharedManager] startMatchWithCategoryID:catIndex withCompletionBlock:^(Match *match)
    {
      //  Round *round = [Round roundWithQuestions:questions andIndex:0];
      //  Match *match = [Match createNewMatchWithRounds:@[round]];
        [Match setCurrentMatch:match];
        [self.navController showGame];
        
         [self.navController hideModalViewController:self];
    }];
}

#pragma mark - Super Methods to Override
- (BOOL)showNav
{
    return NO;
}

- (BOOL)showProfileBar
{
    return NO;
}

- (BackgroundType)backgroundType
{
    return BackgroundTypeNone;
}

- (NSString *)title
{
    return @"";
}

@end
