//
//  NoteManager.h
//  Test
//
//  Created by 常峻玮 on 15/6/2.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NoteManager : NSObject
@property(nonatomic,strong)NSMutableArray *allNote;
@property(nonatomic,strong)NSMutableArray *allNormalNote;
@property(nonatomic,strong)NSMutableArray *allReminderNote;
@property(nonatomic,strong)NSMutableArray *allArchiveNote;
@property(nonatomic,strong)NSMutableArray *allTrashNote;
+(NoteManager *)shareManeger;
-(void)loadAllNote;
@end
