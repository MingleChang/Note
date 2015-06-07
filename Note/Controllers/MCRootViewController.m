//
//  MCRootViewController.m
//  Note
//
//  Created by 常峻玮 on 15/6/4.
//  Copyright (c) 2015年 Mingle. All rights reserved.
//

#import "MCRootViewController.h"
#import "MCChooseViewController.h"
#import "MCRootTabBarViewController.h"
@interface MCRootViewController ()<UIGestureRecognizerDelegate,MCChooseViewControllerDelegate>
@property(nonatomic,strong)MCRootTabBarViewController *tabBarVC;
@property(nonatomic,strong)MCChooseViewController *chooseVC;
@property (weak, nonatomic) IBOutlet UIView *choosView;

- (IBAction)panGestureReconizer:(UIPanGestureRecognizer *)sender;

@end

@implementation MCRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Private Models
-(BOOL)checkShouldMoveWith:(UIPanGestureRecognizer *)sender{
    if (self.choosView.hidden==YES) {
        CGPoint lLocationPoint=[sender locationInView:self.view];
        if (lLocationPoint.x<20) {
            return YES;
        }else{
            return NO;
        }
    }else{
        return YES;
    }
}
#pragma mark - Event Response
- (IBAction)panGestureReconizer:(UIPanGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            if ([self checkShouldMoveWith:sender]) {
                self.choosView.hidden=NO;
                [self.chooseVC beginMove];
            }
            break;
        case UIGestureRecognizerStateChanged:
            if (self.chooseVC.isMoving) {
                [self.chooseVC moveWithOffset:[sender translationInView:self.view]];
            }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:{
            if (self.chooseVC.isMoving) {
                [self.chooseVC moveEnd:^(BOOL hide) {
                    self.choosView.hidden=hide;
                }];
            }
        }break;
        default:
            break;
    }
}
#pragma mark - MCChooseViewController Delegate
-(void)chooseViewController:(MCChooseViewController *)vc selectedIndex:(NSInteger)index{
    self.tabBarVC.selectedIndex=index;
}
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"MCChooseVC"]) {
        self.chooseVC=segue.destinationViewController;
        self.chooseVC.delegate=self;
    }
    if ([segue.identifier isEqualToString:@"MCRootTabBarVC"]) {
        self.tabBarVC=segue.destinationViewController;
    }
}
 
@end
