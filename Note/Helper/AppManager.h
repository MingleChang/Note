//
//  AppManager.h
//  Note
//
//  Created by 常峻玮 on 15/6/8.
//  Copyright (c) 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MCRootViewController;
@class MCRootTabBarViewController;
@interface AppManager : NSObject
@property(nonatomic,strong)MCRootViewController *rootVC;
@property(nonatomic,strong)MCRootTabBarViewController *rootTabBarVC;
+(AppManager *)shareManeger;
@end
