//
//  MCChooseViewController.m
//  Note
//
//  Created by 常峻玮 on 15/6/4.
//  Copyright (c) 2015年 Mingle. All rights reserved.
//

#import "MCChooseViewController.h"

@interface MCChooseViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewWidthConstraint;
@property (weak, nonatomic) IBOutlet UIView *maskView;


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
    [self initAllSubViews];
    [self initAllData];
}
-(void)initAllSubViews{
    self.tableView.transform=CGAffineTransformMakeTranslation(-self.tableViewWidthConstraint.constant, 0);
    self.maskView.alpha=0;
    self.view.hidden=YES;
}
-(void)initAllData{
    
}
#pragma mark - Public Motheds
-(void)beginMove{
    
}
-(void)moveWithOffset:(CGPoint)offset{
    
}
-(void)moveEnd{
    
}
-(void)showChooseView{
    
}
-(void)hideChooseView{
    
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
