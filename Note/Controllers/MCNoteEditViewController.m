//
//  MCNoteEditViewController.m
//  Note
//
//  Created by 常峻玮 on 15/5/5.
//  Copyright (c) 2015年 Mingle. All rights reserved.
//

#import "MCNoteEditViewController.h"
#import "MCTextView.h"
#import "MCDottedLineView.h"
#import "Common.h"
@interface MCNoteEditViewController ()
@property (weak, nonatomic) IBOutlet MCTextView *titleTextView;
@property (weak, nonatomic) IBOutlet MCTextView *detailTextView;
@property (weak, nonatomic) IBOutlet MCDottedLineView *lineView;

@end

@implementation MCNoteEditViewController

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
    [self initAllSubView];
    [self initAllData];
}
-(void)initAllSubView{
    self.titleTextView.font=[UIFont boldSystemFontOfSize:19];
    self.titleTextView.placeholderString=@"标题";
    self.titleTextView.backgroundColor=[UIColor clearColor];
    
    self.detailTextView.font=[UIFont systemFontOfSize:18];
    self.detailTextView.placeholderString=@"内容";
    self.detailTextView.backgroundColor=[UIColor clearColor];
    
    self.lineView.backgroundColor=RGB(232, 232, 232);
}
-(void)initAllData{
    
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
