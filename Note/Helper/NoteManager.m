//
//  NoteManager.m
//  Test
//
//  Created by 常峻玮 on 15/6/2.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import "NoteManager.h"
#import "Common.h"
@implementation NoteManager
+(NoteManager *)shareManeger{
    static NoteManager *sharedNoteManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedNoteManager = [[NoteManager alloc]init];
    });
    return  sharedNoteManager;
}
-(void)loadAllNote{
    NSArray *lAllNote=[[SQLiteHelper shareManeger]selectAllNote];
    NSPredicate *lNormalPredicate=[NSPredicate predicateWithFormat:@"status=0"];
    NSPredicate *lReminderPredicate=[NSPredicate predicateWithFormat:@"reminderType!=0 AND status!=-1"];
    NSPredicate *lArchivePredicate=[NSPredicate predicateWithFormat:@"status=10"];
    NSPredicate *lTrashPredicate=[NSPredicate predicateWithFormat:@"status=-1"];
    NSArray *lAllNormalNote=[lAllNote filteredArrayUsingPredicate:lNormalPredicate];
    NSArray *lAllReminderNote=[lAllNote filteredArrayUsingPredicate:lReminderPredicate];
    NSArray *lAllArchiveNote=[lAllNote filteredArrayUsingPredicate:lArchivePredicate];
    NSArray *lAllTrashNote=[lAllNote filteredArrayUsingPredicate:lTrashPredicate];
    self.allNote=[lAllNote mutableCopy];
    self.allNormalNote=[lAllNormalNote mutableCopy];
    self.allReminderNote=[lAllReminderNote mutableCopy];
    self.allArchiveNote=[lAllArchiveNote mutableCopy];
    self.allTrashNote=[lAllTrashNote mutableCopy];
}
@end
