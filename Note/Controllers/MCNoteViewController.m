//
//  MCNoteViewController.m
//  Note
//
//  Created by 常峻玮 on 15/5/5.
//  Copyright (c) 2015年 Mingle. All rights reserved.
//

#import "MCNoteViewController.h"
#import "MCRootViewController.h"
#import "Common.h"
#import "MCNoteCell.h"
#import "MCNoteInfoViewController.h"
#import "MCNoteEditViewController.h"
#define CELL_ID @"MCNoteCellId"
#define NOTE_INFO_VC_ID @"MCNoteInfoViewController"
#define NOTE_EDIT_VC_ID @"MCNoteEditViewController"
@interface MCNoteViewController()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *addNoteButton;

- (IBAction)leftBarButtonClick:(UIBarButtonItem *)sender;
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
    self.addNoteButton.layer.cornerRadius=25;
    self.addNoteButton.layer.shadowOffset=CGSizeMake(-1, 1);
    self.addNoteButton.layer.shadowOpacity=1;
}
-(void)showChooseView{
    [[AppManager shareManeger].rootVC showChooseView];
}
#pragma mark - Event Response
- (IBAction)leftBarButtonClick:(UIBarButtonItem *)sender {
    [self showChooseView];
}

- (IBAction)addNoteButtonClick:(UIButton *)sender {
    Note *lNewNote=[[Note alloc]init];
//    [self performSegueWithIdentifier:NOTE_INFO_VC_ID sender:lNewNote];
    
    [self performSegueWithIdentifier:NOTE_EDIT_VC_ID sender:lNewNote];
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
    Note *lNote=[[NoteManager shareManeger].allNormalNote objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:NOTE_INFO_VC_ID sender:lNote];
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

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:NOTE_INFO_VC_ID]) {
        MCNoteInfoViewController *lNoteInfoViewController=(MCNoteInfoViewController *)segue.destinationViewController;
        lNoteInfoViewController.note=sender;
    }
}

@end
