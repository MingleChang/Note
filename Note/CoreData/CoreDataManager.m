//
//  CoreDataManager.m
//  CoreData
//
//  Created by Mingle Chang on 13-10-17.
//  Copyright (c) 2013年 Mingle. All rights reserved.
//

#import "CoreDataManager.h"
static CoreDataManager *shareManager=nil;
@implementation CoreDataManager
+(CoreDataManager *)shareManager{
    @synchronized(self){
        if (shareManager==nil) {
            shareManager=[[CoreDataManager alloc]init];
        }
    }
    return shareManager;
}
-(NSManagedObjectModel *)managedObjectModel{
    if (_managedObjectModel!=nil) {
        return _managedObjectModel;
    }
    _managedObjectModel=[NSManagedObjectModel mergedModelFromBundles:nil];
    return _managedObjectModel;
}
-(NSPersistentStoreCoordinator *)persistenStoreCoordinator{
    if (_persistenStoreCoordinator!=nil) {
        return _persistenStoreCoordinator;
    }
    //得到数据库路径
    NSString *docs=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSURL *storeURL=[NSURL fileURLWithPath:[docs stringByAppendingPathComponent:@"Shopping.sqlite"]];
    _persistenStoreCoordinator=[[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:self.managedObjectModel];
    NSError *error;
    if (![_persistenStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        NSLog(@"error:%@,%@",error,[error userInfo]);
    }
    return _persistenStoreCoordinator;
}
-(NSManagedObjectContext *)managedObjectContext{
    if (_managedObjectContext!=nil) {
        return _managedObjectContext;
    }
    NSPersistentStoreCoordinator *coordinator=[self persistenStoreCoordinator];
    if (coordinator!=nil) {
        _managedObjectContext=[[NSManagedObjectContext alloc]init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

@end
