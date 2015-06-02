//
//  SQLiteHelper.m
//  Test
//
//  Created by 常峻玮 on 15/6/2.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import "SQLiteHelper.h"

@implementation SQLiteHelper
+(SQLiteHelper *)shareManeger{
    static SQLiteHelper *sharedSQLiteHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSQLiteHelper = [[SQLiteHelper alloc]init];
    });
    return  sharedSQLiteHelper;
}
-(instancetype)init{
    self=[super init];
    if (self) {
        
    }
    return self;
}
@end
