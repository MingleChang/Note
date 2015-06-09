//
//  MCListChooseView.m
//  Test
//
//  Created by 常峻玮 on 15/6/9.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import "MCListChooseView.h"
#import "MCListChooseCell.h"
#define CELL_HEIGHT 20
#define CELL_WIDTH 80
#define CELL_ID @"MCListChooseCellId"
@interface MCListChooseView()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSArray *titleArray;
@end
@implementation MCListChooseView
-(instancetype)initWithList:(NSArray *)array{
    self=[super init];
    if (self) {
        self.titleArray=array;
        [self addSubview:self.tableView];
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
}
-(void)showInView:(UIView *)view withPoint:(CGPoint)point{
    self.frame=view.bounds;
    CGRect lTableViewFrame=self.tableView.frame;
    lTableViewFrame.origin=point;
    self.tableView.frame=lTableViewFrame;
    [view addSubview:self];
}
#pragma mark - Setter And Getter
-(UITableView *)tableView{
    if (_tableView) {
        return _tableView;
    }
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, CELL_WIDTH, self.titleArray.count*CELL_HEIGHT) style:UITableViewStylePlain];
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _tableView.layer.borderColor=[UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1.0].CGColor;
    _tableView.layer.borderWidth=1;
    _tableView.layer.shadowColor=[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0].CGColor;
    _tableView.layer.shadowOffset=CGSizeMake(1, -1);
    _tableView.layer.shadowOpacity=0.5;
    [_tableView registerNib:[UINib nibWithNibName:@"MCListChooseCell" bundle:nil] forCellReuseIdentifier:CELL_ID];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    return _tableView;
}
#pragma mark - TableView DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MCListChooseCell *lCell=(MCListChooseCell *)[tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    NSInteger row=indexPath.row;
    [lCell setChooseTitle:self.titleArray[row]];
    return lCell;
}
#pragma mark - TableView Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELL_HEIGHT;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
