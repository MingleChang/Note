//
//  SQLiteHelper.m
//  Test
//
//  Created by 常峻玮 on 15/6/2.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import "SQLiteHelper.h"
#import "StartUp.h"
#import "Note.h"
#import "SQLStr.h"
@implementation SQLiteHelper
#pragma mark -
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
        NSString *lDBPath=[DOCUMENT_PATH stringByAppendingPathComponent:@"Note.sqlite"];
        self.dbQueue=[FMDatabaseQueue databaseQueueWithPath:lDBPath];
    }
    return self;
}
#pragma mark - SQL
-(BOOL)insertNote:(Note *)note{
    NSDictionary *lDic=[note getAllInfoDictionary];
    __block BOOL success=NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        success=[db executeUpdate:[SQLStr getInsertNoteSqlWithDic] withParameterDictionary:lDic];
    }];
    return success;
}
-(BOOL)updateNote:(Note *)note{
    NSDictionary *lDic=[note getAllInfoDictionary];
    __block BOOL success=NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        success=[db executeUpdate:[SQLStr getUpdateNoteSqlWithDic] withParameterDictionary:lDic];
    }];
    return success;
}
-(BOOL)deleteNote:(Note *)note{
    NSDictionary *lDic=[note getAllInfoDictionary];
    __block BOOL success=NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        success=[db executeUpdate:[SQLStr getDeleteNoteSqlWithDic] withParameterDictionary:lDic];
    }];
    return success;
}
-(NSArray *)selectAllNote{
    __block NSArray *lResultArray=nil;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *lResults=[db executeQuery:[SQLStr getSelectAllNoteSqlWithDic]];
        lResultArray=[self getNoteArrayBy:lResults];
        [lResults close];
    }];
    return lResultArray;
}
-(BOOL)deleteInvalidNote{
    __block BOOL success=NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        success=[db executeUpdate:[SQLStr getDeleteInvalidNoteSqlWithDic]];
    }];
    return success;
}
#pragma mark - Private Models
-(NSArray *)getNoteArrayBy:(FMResultSet *)result{
    NSMutableArray *lMutableArray=[NSMutableArray array];
    while ([result next]) {
        NSMutableDictionary *lDic=[NSMutableDictionary dictionary];
        for (NSString *lKey in [Note getAllProperty]) {
            if ([lKey isEqualToString:@"reminderTime"]||[lKey isEqualToString:@"repeatEndTime"]||[lKey isEqualToString:@"createTime"]||[lKey isEqualToString:@"modifyTime"]||[lKey isEqualToString:@"deleteTime"]) {
                NSDate *lDate=[NSDate dateWithTimeIntervalSince1970:[[result objectForColumnName:lKey] doubleValue]];
                [lDic setObject:lDate forKey:lKey];
            }else{
                [lDic setObject:[result objectForColumnName:lKey] forKey:lKey];
            }
        }
        Note *lNote=[[Note alloc]initWithDBDictionary:lDic];
        [lMutableArray addObject:lNote];
    }
    return [lMutableArray copy];
}

#pragma mark - Setter And Getter
-(FMDatabaseQueue *)dbQueue{
    if (_dbQueue) {
        return _dbQueue;
    }
    NSString *lDBPath=[DOCUMENT_PATH stringByAppendingPathComponent:@"Note.sqlite"];
    _dbQueue=[FMDatabaseQueue databaseQueueWithPath:lDBPath];
    return _dbQueue;
}
@end
