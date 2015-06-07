//
//  MCChooseViewController.h
//  Note
//
//  Created by 常峻玮 on 15/6/4.
//  Copyright (c) 2015年 Mingle. All rights reserved.
//

#import "MCViewController.h"
@class MCChooseViewController;
@protocol MCChooseViewControllerDelegate <NSObject>

-(void)chooseViewController:(MCChooseViewController *)vc selectedIndex:(NSInteger)index;

@end
@interface MCChooseViewController : MCViewController
@property(nonatomic,assign)id<MCChooseViewControllerDelegate> delegate;
@property(nonatomic,assign)BOOL isMoving;
-(void)beginMove;
-(void)moveWithOffset:(CGPoint)offset;
-(void)moveEnd:(void(^)(BOOL show))block;
-(void)showChooseView;
-(void)hideChooseView;
@end
