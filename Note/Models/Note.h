//
//  Note.h
//  Test
//
//  Created by 常峻玮 on 15/6/2.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum NoteReminderType{
    NoteReminderTypeNone,
    NoteReminderTypeTime,
    NoteReminderTypeArea
}NoteReminderType;
typedef enum NoteContentType{
    NoteContentTypeText,
    NoteContentTypeList
}NoteContentType;
typedef enum NoteRepeatType{
    NoteRepeatTypeNone,
    NoteRepeatTypeDay,
    NoteRepeatTypeWeek,
    NoteRepeatTypeMonth,
    NoteRepeatTypeYear,
}NoteRepeatType;
typedef enum NoteRepeatWeekType{
    NoteRepeatWeekTypeMon=(1UL << 1),
    NoteRepeatWeekTypeTue=(1UL << 2),
    NoteRepeatWeekTypeWed=(1UL << 3),
    NoteRepeatWeekTypeThu=(1UL << 4),
    NoteRepeatWeekTypeFri=(1UL << 5),
    NoteRepeatWeekTypeSat=(1UL << 6),
    NoteRepeatWeekTypeSun=(1UL << 7)
}NoteRepeatWeekType;
typedef enum NoteRepeatEndType{
    NoteRepeatEndTypeNone,
    NoteRepeatEndTypeTime,
    NoteRepeatEndTypeCount,
    NoteRepeatEndTypeTimeAndCount
}NoteRepeatEndType;
typedef enum NoteRepeatAreaType{
    NoteRepeatAreaTypeNone,
    NoteRepeatAreaTypeEntry,
    NoteRepeatAreaTypeExit,
    NoteRepeatAreaTypeEntryAndExit
}NoteRepeatAreaType;
typedef enum NoteStatus{
    NoteStatusTrash=-1,
    NoteStatusNormal,
    NoteStatusArchive=10
}NoteStatus;
@interface Note : NSObject
@property(nonatomic,copy)NSString *noteId;//ID
@property(nonatomic,copy)NSString *userId;
@property(nonatomic,copy)NSString *title;//标题
@property(nonatomic,copy)NSString *content;//内容
@property(nonatomic,copy)NSArray *contentArray;//列表内容
@property(nonatomic,copy)NSString *checkedContent;//勾选内容
@property(nonatomic,copy)NSArray *checkedContentArray;//列表勾选内容
@property(nonatomic,assign)NoteContentType contentType;//内容的类型
@property(nonatomic,assign)NoteReminderType reminderType;//提醒类型
@property(nonatomic,copy)NSDate *reminderTime;//提醒时间
@property(nonatomic,assign)NoteRepeatType repeatType;
@property(nonatomic,assign)NSInteger repeatValue;
@property(nonatomic,assign)NoteRepeatWeekType repeatWeekType;
@property(nonatomic,assign)NoteRepeatEndType repeatEndType;
@property(nonatomic,copy)NSDate *repeatEndTime;
@property(nonatomic,assign)NSInteger repeatCount;
@property(nonatomic,assign)CGFloat longitude;
@property(nonatomic,assign)CGFloat latitude;
@property(nonatomic,assign)CGFloat repeatAreaRadius;
@property(nonatomic,assign)NoteRepeatAreaType repeatAreaType;

@property(nonatomic,assign)NoteStatus status;

@property(nonatomic,copy)NSDate *createTime;
@property(nonatomic,copy)NSDate *modifyTime;
@property(nonatomic,copy)NSDate *deleteTime;

-(instancetype)init;
-(instancetype)initWithDBDictionary:(NSDictionary *)dic;

-(BOOL)save;
-(BOOL)update;
-(BOOL)destroy;

-(NSArray *)getAllInfoArray;
-(NSDictionary *)getAllInfoDictionary;

+(NSArray *)getAllProperty;
@end
