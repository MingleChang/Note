//
//  SQLiteHelper.h
//  Test
//
//  Created by 常峻玮 on 15/6/2.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
@class Note;
@interface SQLiteHelper : NSObject
@property(nonatomic,strong)FMDatabaseQueue *dbQueue;
+(SQLiteHelper *)shareManeger;

-(BOOL)insertNote:(Note *)note;
-(BOOL)updateNote:(Note *)note;
-(BOOL)deleteNote:(Note *)note;
-(NSArray *)selectAllNote;
-(BOOL)deleteInvalidNote;
@end
