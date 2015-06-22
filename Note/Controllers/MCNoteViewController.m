//
//  MCNoteViewController.m
//  Note
//
//  Created by 常峻玮 on 15/5/5.
//  Copyright (c) 2015年 Mingle. All rights reserved.
//

#import "MCNoteViewController.h"
#import "Common.h"
#import "MCNoteCell.h"
#define CELL_ID @"MCNoteCellId"
@interface MCNoteViewController()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *addNoteButton;

- (IBAction)addNoteButtonClick:(UIButton *)sender;

@end
@implementation MCNoteViewController
#pragma mark - Life Circle
-(void)viewDidLoad{
    [super viewDidLoad];
    [self initAllSubViewAndData];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
#pragma mark - Private Motheds
-(void)initAllSubViewAndData{
    [self initAllData];
    [self initAllSubViews];
}
-(void)initAllData{
    
}
-(void)initAllSubViews{
    [self.collectionView registerNib:[UINib nibWithNibName:@"MCNoteCell" bundle:nil] forCellWithReuseIdentifier:CELL_ID];
//    [self.addNoteButton setBackgroundColor:RGB(217, 52, 72)];
    [self.addNoteButton setTitle:@"+" forState:UIControlStateNormal];
    self.addNoteButton.layer.cornerRadius=25;
}
#pragma mark - Event Response
- (IBAction)addNoteButtonClick:(UIButton *)sender {
}
#pragma mark - CollectionView DataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [NoteManager shareManeger].allNormalNote.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MCNoteCell *lCell=(MCNoteCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CELL_ID forIndexPath:indexPath];
    return lCell;
}
#pragma mark - CollectionView Delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
}
#pragma mark - CollectionView FlowLayout Delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(([MCDevice screenSize].width-20)/2, (([MCDevice screenSize].width-20)/2)/4*3);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

@end
