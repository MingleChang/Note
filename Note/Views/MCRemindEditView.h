//
//  MCRemindEditView.h
//  Text
//
//  Created by 常峻玮 on 15/5/6.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCRemindEditView : UIView
@property(nonatomic,assign)BOOL needRemind;
@property(nonatomic,assign)UIEdgeInsets contentInsets;
@property(nonatomic,strong)NSDate *remindDate;
@end
