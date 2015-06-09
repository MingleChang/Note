//
//  MCListChooseView.h
//  Test
//
//  Created by 常峻玮 on 15/6/9.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCListChooseView : UIView
-(instancetype)initWithList:(NSArray *)array;
-(void)showInView:(UIView *)view withPoint:(CGPoint)point;
@end
