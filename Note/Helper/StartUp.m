//
//  StartUp.m
//  Test
//
//  Created by 常峻玮 on 15/6/2.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import "StartUp.h"
#import "Common.h"
@implementation StartUp
+(void)launch{
    [self checkDB];
    [self deleteInvalidNote];
    [self loadAllNote];
}
+(BOOL)checkDB{
    NSString *lDBPath=[DOCUMENT_PATH stringByAppendingPathComponent:@"Note.sqlite"];
    if ([[NSFileManager defaultManager]fileExistsAtPath:lDBPath]) {
        return YES;
    }
    NSString *lBuddleDBPath=[[NSBundle mainBundle]pathForResource:@"Note" ofType:@"sqlite"];
    if ([[NSFileManager defaultManager]copyItemAtPath:lBuddleDBPath toPath:lDBPath error:nil]) {
        return YES;
    }
    return NO;
}
+(BOOL)deleteInvalidNote{
    return [[SQLiteHelper shareManeger]deleteInvalidNote];
}
+(void)loadAllNote{
    [[NoteManager shareManeger]loadAllNote];
}
@end
