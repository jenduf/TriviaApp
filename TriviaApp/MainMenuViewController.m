//
//  MainMenuViewController.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "MainMenuViewController.h"
#import "MainMenuCell.h"
#import "TrivieBackgroundView.h"
#import "MenuFooterView.h"
#import "MenuHeaderView.h"

@interface MainMenuViewController ()
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *mainMenuTableView;
@property (nonatomic, strong) NSMutableDictionary *matchesDictionary;

- (IBAction)startGame:(id)sender;

@end

@implementation MainMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.matchesDictionary = [[NSMutableDictionary alloc] init];
    
    [self loadMatches];
}

- (void)loadMatches
{
    [[ParseManager sharedManager] getMatchesForUserName:[User currentUser].userName withCompletionBlock:^(NSArray *matches)
     {
         
         self.matchesDictionary[@(MatchSectionYourTurn)] = [self parseMatches:matches forSection:MatchSectionYourTurn];
         self.matchesDictionary[@(MatchSectionTheirTurn)] = [self parseMatches:matches forSection:MatchSectionTheirTurn];
         self.matchesDictionary[@(MatchSectionGameOver)] = [self parseMatches:matches forSection:MatchSectionGameOver];
         
         [self.mainMenuTableView reloadData];
     }];
}

- (IBAction)startGame:(id)sender
{
    [self.navController showModalViewControllerWithIdentifier:GAME_CREATION_VIEW_CONTROLLER];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)parseMatches:(NSArray *)matches forSection:(MatchSection)section
{
    NSMutableArray *matchArray = [NSMutableArray array];
    
    for(Match *m in matches)
    {
        if(section == MatchSectionYourTurn)
        {
            if([m isPlayerTurn])
                [matchArray addObject:m];
        }
        else if(section == MatchSectionTheirTurn)
        {
            if(![m isPlayerTurn])
                [matchArray addObject:m];
        }
        else
        {
            if(m.matchStatus == MatchStatusGameOver)
                [matchArray addObject:m];
        }
    }
    
    return matchArray;
}

#pragma mark - UITableView Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.matchesDictionary.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = self.matchesDictionary[@(section)];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainMenuCell *cell = (MainMenuCell *)[tableView dequeueReusableCellWithIdentifier:MAIN_MENU_CELL_IDENTIFIER];
    [cell setTag:indexPath.section];
    
    NSArray *arr = self.matchesDictionary[@(indexPath.section)];

    Match *match = arr[indexPath.row];
    
    [cell setMatch:match];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return MENU_HEADER_HEIGHT;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    MenuHeaderView *headerView = [[MenuHeaderView alloc] initWithFrame:CGRectMake(0, 0, tableView.width, MENU_HEADER_HEIGHT)];
    [headerView setTrivieColor:(TrivieColor)section];
    
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    MenuFooterView *footerView = [[MenuFooterView alloc] initWithFrame:CGRectMake(0, 0, tableView.width, tableView.sectionFooterHeight)];
    [footerView setTrivieColor:(TrivieColor)(section + 1)];
    
    return footerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arr = self.matchesDictionary[@(indexPath.section)];
    
    Match *match = arr[indexPath.row];
    [Match setCurrentMatch:match];
    
    if(indexPath.section == MatchSectionYourTurn)
    {
        [self.navController showGame];
    }
    else
    {
        [self.navController navigateToViewControllerWithIdentifier:GAME_STATUS_VIEW_CONTROLLER completion:^
        {
            
        }];
    }
}

#pragma mark - Super Methods to Override
- (BOOL)showNav
{
    return YES;
}

- (BOOL)showProfileBar
{
    return YES;
}

- (BackgroundType)backgroundType
{
    return BackgroundTypeScrolling;
}

- (NavigationType)navigationType
{
    return NavigationTypeUpDown;
}

- (NSString *)title
{
    return @"";
}

@end
