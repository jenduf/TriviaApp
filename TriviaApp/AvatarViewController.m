//
//  AvatarViewController.m
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/23/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "AvatarViewController.h"
#import "AvatarCell.h"

@interface AvatarViewController ()
<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) IBOutlet UICollectionView *avatarCollectionView;

@end

@implementation AvatarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView Datasource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)cv
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)cv numberOfItemsInSection:(NSInteger)section
{
    return TOTAL_AVATARS;
}

- (UICollectionViewCell *)collectionView:(UICollectionView*)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AvatarCell *cell = [cv dequeueReusableCellWithReuseIdentifier:AVATAR_CELL_IDENTIFIER forIndexPath:indexPath];
    
    [cell setSelected:NO];
    
    [cell setAvatarID:(indexPath.item + 1)];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger avatarID = (indexPath.item + 1);
    
    [[User currentUser] setAvatarID:avatarID];
    
    [[User currentUser] save];
    
    AvatarCell *cell = (AvatarCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell setSelected:YES];
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
