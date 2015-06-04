//
//  MCChooseViewController.m
//  Note
//
//  Created by 常峻玮 on 15/6/4.
//  Copyright (c) 2015年 Mingle. All rights reserved.
//

#import "MCChooseViewController.h"

@interface MCChooseViewController ()
- (IBAction)panGestureRecognizer:(UIPanGestureRecognizer *)sender;

@end

@implementation MCChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Event Response
- (IBAction)panGestureRecognizer:(UIPanGestureRecognizer *)sender {
    CGPoint lPoint1=[sender translationInView:self.view];
    CGPoint lPoint2=[sender locationInView:self.view];
    NSLog(@"++++++%@",NSStringFromCGPoint(lPoint1));
    NSLog(@"------%@",NSStringFromCGPoint(lPoint2));
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            
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

#pragma mark - Gesture Delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    CGPoint translation = [(UIPanGestureRecognizer*)gestureRecognizer translationInView:self.view];
    if (fabs(translation.x)>fabs(translation.y)) {
        return YES;
    }else{
        return NO;
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
