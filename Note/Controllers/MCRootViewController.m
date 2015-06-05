//
//  MCRootViewController.m
//  Note
//
//  Created by 常峻玮 on 15/6/4.
//  Copyright (c) 2015年 Mingle. All rights reserved.
//

#import "MCRootViewController.h"
#import "MCChooseViewController.h"
@interface MCRootViewController ()<UIGestureRecognizerDelegate>
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

#pragma mark - Event Response
- (IBAction)panGestureReconizer:(UIPanGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            NSLog(@"%@",NSStringFromCGPoint([sender translationInView:self.view]));
            break;
        case UIGestureRecognizerStateChanged:
            
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
            
            break;
        default:
            break;
    }
}
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"MCChooseVC"]) {
        self.chooseVC=segue.destinationViewController;
    }
}
 
@end
