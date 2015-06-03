//
//  SQLStr.m
//  Test
//
//  Created by 常峻玮 on 15/6/3.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import "SQLStr.h"

@implementation SQLStr
+(NSString *)getInsertNoteSqlWithDic{
    return @"INSERT INTO Note"
    @"(noteId,title,content,checkedContent,contentType,reminderType,"
    @"reminderTime,repeatType,repeatValue,repeatWeekType,repeatEndType,"
    @"repeatEndTime,repeatCount,longitude,latitude,repeatAreaRadius,"
    @"repeatAreaType,status,createTime,modifyTime,deleteTime)"
    @"VALUES (:noteId,:title,:content,:checkedContent,:contentType,:reminderType,"
    @":reminderTime,:repeatType,:repeatValue,:repeatWeekType,:repeatEndType,"
    @":repeatEndTime,:repeatCount,:longitude,:latitude,:repeatAreaRadius,"
    @":repeatAreaType,:status,:createTime,:modifyTime,:deleteTime)";
}
+(NSString *)getUpdateNoteSqlWithDic{
    return @"UPDATE Note SET "
    @"title=:title,content=:content,checkedContent=:checkedContent,contentType=:contentType,"
    @"reminderType=:reminderType,reminderTime=:reminderTime,repeatType=:repeatType,repeatValue=:repeatValue,"
    @"repeatWeekType=:repeatWeekType,repeatEndType=:repeatEndType,repeatEndTime=:repeatEndTime,"
    @"repeatCount=:repeatCount,longitude=:longitude,latitude=:latitude,"
    @"repeatAreaRadius=:repeatAreaRadius,repeatAreaType=:repeatAreaType,status=:status,"
    @"createTime=:createTime,modifyTime=:modifyTime,deleteTime=:deleteTime "
    @"WHERE noteId=:noteId";
}
+(NSString *)getDeleteNoteSqlWithDic{
    return @"DELETE FROM Note WHERE noteId=:noteId";
}
+(NSString *)getSelectAllNoteSqlWithDic{
    return @"SELECT * FROM Note";
}
@end
