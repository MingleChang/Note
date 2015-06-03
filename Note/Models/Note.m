//
//  Note.m
//  Test
//
//  Created by 常峻玮 on 15/6/2.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import "Note.h"
#import "SQLiteHelper.h"
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
        self.repeatWeekType=0;
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

#pragma mark -
-(BOOL)save{
    return [[SQLiteHelper shareManeger]insertNote:self];
}
-(BOOL)update{
    return [[SQLiteHelper shareManeger]updateNote:self];
}
-(BOOL)destroy{
    return [[SQLiteHelper shareManeger]deleteNote:self];
}

#pragma mark -
-(NSArray *)getAllInfoArray{
    NSMutableArray *lMutableArray=[NSMutableArray array];
    [lMutableArray addObject:self.noteId];
    [lMutableArray addObject:self.title];
    [lMutableArray addObject:self.content];
    [lMutableArray addObject:self.checkedContent];
    [lMutableArray addObject:@(self.contentType)];
    [lMutableArray addObject:@(self.reminderType)];
    [lMutableArray addObject:self.reminderTime];
    [lMutableArray addObject:@(self.repeatType)];
    [lMutableArray addObject:@(self.repeatValue)];
    [lMutableArray addObject:@(self.repeatWeekType)];
    [lMutableArray addObject:@(self.repeatEndType)];
    [lMutableArray addObject:self.repeatEndTime];
    [lMutableArray addObject:@(self.repeatCount)];
    [lMutableArray addObject:@(self.longitude)];
    [lMutableArray addObject:@(self.latitude)];
    [lMutableArray addObject:@(self.repeatAreaRadius)];
    [lMutableArray addObject:@(self.repeatAreaType)];
    [lMutableArray addObject:@(self.status)];
    [lMutableArray addObject:self.createTime];
    [lMutableArray addObject:self.modifyTime];
    [lMutableArray addObject:self.deleteTime];
    return [lMutableArray copy];
}
-(NSDictionary *)getAllInfoDictionary{
    return [self dictionaryWithValuesForKeys:[Note getAllProperty]];
}
#pragma mark - 类方法
+(NSArray *)getAllProperty{
    return @[@"noteId",@"title",@"content",@"checkedContent",@"contentType",@"reminderType",@"reminderTime",@"repeatType",@"repeatValue",@"repeatWeekType",@"repeatEndType",@"repeatEndTime",@"repeatCount",@"longitude",@"latitude",@"repeatAreaRadius",@"repeatAreaType",@"status",@"createTime",@"modifyTime",@"deleteTime"];
}
@end
