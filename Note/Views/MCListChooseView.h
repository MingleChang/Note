//
//  MCListChooseView.h
//  Test
//
//  Created by 常峻玮 on 15/6/9.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MCListChooseView;
@protocol MCListChooseViewDelegate <NSObject>

@optional
-(void)listChooseView:(MCListChooseView *)view selectIndex:(NSInteger)index;
-(void)listChooseViewCancel:(MCListChooseView *)view;

@end

@interface MCListChooseView : UIView
@property(nonatomic,assign)id<MCListChooseViewDelegate> delegate;
-(instancetype)initWithList:(NSArray *)array;
-(void)showInView:(UIView *)view withPoint:(CGPoint)point;
@end
