//
//  SQLStr.h
//  Test
//
//  Created by 常峻玮 on 15/6/3.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQLStr : NSObject
+(NSString *)getInsertNoteSqlWithDic;
+(NSString *)getUpdateNoteSqlWithDic;
+(NSString *)getDeleteNoteSqlWithDic;
+(NSString *)getSelectAllNoteSqlWithDic;
@end
