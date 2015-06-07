//
//  MCChooseViewController.m
//  Note
//
//  Created by 常峻玮 on 15/6/4.
//  Copyright (c) 2015年 Mingle. All rights reserved.
//

#import "MCChooseViewController.h"

@interface MCChooseViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewWidthConstraint;
@property (weak, nonatomic) IBOutlet UIView *maskView;
@property(nonatomic,assign)CGPoint offset;
@property(nonatomic,copy)NSArray *cellTitleArray;
@end

@implementation MCChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initAllSubViewAndData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Private Motheds
-(void)initAllSubViewAndData{
    [self initAllData];
    [self initAllSubViews];
}
-(void)initAllSubViews{
    self.tableView.transform=CGAffineTransformMakeTranslation(-self.tableViewWidthConstraint.constant, 0);
    self.maskView.alpha=0;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellId"];
}
-(void)initAllData{
    self.cellTitleArray=@[@"记事",@"提醒",@"归档",@"回收站"];
}
-(BOOL)checkShouldHide{
    if (fabs(self.tableView.transform.tx)>self.tableViewWidthConstraint.constant/2) {
        return YES;
    }else{
        return NO;
    }
}
#pragma mark - Public Motheds
-(void)beginMove{
    self.isMoving=YES;
    self.offset=CGPointZero;
}
-(void)moveWithOffset:(CGPoint)offset{
    CGFloat xOffset=offset.x-self.offset.x;
    if (self.tableView.transform.tx+xOffset<-self.tableViewWidthConstraint.constant) {
        self.tableView.transform=CGAffineTransformMakeTranslation(-self.tableViewWidthConstraint.constant, 0);
    }else if (self.tableView.transform.tx+xOffset>0){
        self.tableView.transform=CGAffineTransformMakeTranslation(0, 0);
    }else{
        self.tableView.transform=CGAffineTransformTranslate(self.tableView.transform, xOffset, 0);
    }
    self.maskView.alpha=1-fabs(self.tableView.transform.tx)/self.tableViewWidthConstraint.constant;
    self.offset=offset;
}
-(void)moveEnd:(void(^)(BOOL show))block{
    self.isMoving=NO;
    self.offset=CGPointZero;
    BOOL isHide=[self checkShouldHide];
    if (isHide) {
        [UIView animateWithDuration:0.3 animations:^{
            self.tableView.transform=CGAffineTransformMakeTranslation(-self.tableViewWidthConstraint.constant, 0);
            self.maskView.alpha=0;
        } completion:^(BOOL finished) {
            block(isHide);
        }];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            self.tableView.transform=CGAffineTransformMakeTranslation(0, 0);
            self.maskView.alpha=1;
        } completion:^(BOOL finished) {
            block(isHide);
        }];
    }
    
}
-(void)showChooseView{
    
}
-(void)hideChooseView{
    
}

#pragma mark - TableView DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellTitleArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *lCell=[tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    NSInteger row=indexPath.row;
    lCell.textLabel.text=self.cellTitleArray[row];
    return lCell;
}
#pragma  mark - TableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(chooseViewController:selectedIndex:)]) {
        [self.delegate chooseViewController:self selectedIndex:indexPath.row];
    }
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
