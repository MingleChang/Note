//
//  Note.m
//  Test
//
//  Created by 常峻玮 on 15/6/2.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import "Note.h"

@implementation Note
#pragma mark - 初始化
-(instancetype)init{
    self = [super init];
    if (self) {
        self.noteId=[NSUUID UUID].UUIDString;
        self.title=@"";
        self.content=@"";
        self.contentArray=[NSArray array];
        self.checkedContent=@"";
        self.checkedContentArray=[NSArray array];
        self.contentType=NoteContentTypeText;
        self.reminderType=NoteReminderTypeNone;
        self.reminderTime=[NSDate date];
        self.repeatType=NoteRepeatTypeNone;
        self.repeatValue=1;
        self.repeatEndType=NoteRepeatEndTypeNone;
        self.repeatEndTime=[NSDate date];
        self.repeatCount=1;
        self.longitude=0;
        self.latitude=0;
        self.repeatAreaRadius=50;
        self.repeatAreaType=NoteRepeatAreaTypeEntryAndExit;
        self.status=NoteStatusNormal;
        self.createTime=[NSDate date];
        self.modifyTime=[NSDate date];
        self.deleteTime=[NSDate date];
    }
    return self;
}
-(instancetype)initWithDBDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
@end
