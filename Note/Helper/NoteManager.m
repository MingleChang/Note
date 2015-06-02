//
//  NoteManager.m
//  Test
//
//  Created by 常峻玮 on 15/6/2.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import "NoteManager.h"

@implementation NoteManager
+(NoteManager *)shareManeger{
    static NoteManager *sharedNoteManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedNoteManager = [[NoteManager alloc]init];
    });
    return  sharedNoteManager;
}
@end
