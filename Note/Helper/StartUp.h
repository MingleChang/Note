//
//  StartUp.h
//  Test
//
//  Created by 常峻玮 on 15/6/2.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DOCUMENT_PATH NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]
#define LIBRARY_PATH NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0]

@interface StartUp : NSObject
+(void)launch;
+(BOOL)checkDB;
+(BOOL)deleteInvalidNote;
+(void)loadAllNote;
@end
