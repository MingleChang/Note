//
//  AppManager.m
//  Note
//
//  Created by 常峻玮 on 15/6/8.
//  Copyright (c) 2015年 Mingle. All rights reserved.
//

#import "AppManager.h"

@implementation AppManager
+(AppManager *)shareManeger{
    static AppManager *sharedAppManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedAppManager = [[AppManager alloc]init];
    });
    return  sharedAppManager;
}
@end
