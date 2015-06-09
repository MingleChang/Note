//
//  Common.h
//  Note
//
//  Created by 常峻玮 on 15/5/5.
//  Copyright (c) 2015年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCImageExtension.h"
#import "MCDateExtension.h"
#import "MCStringExtension.h"
#import "MCDevice.h"
#import "StartUp.h"
#import "SQLStr.h"
#import "NoteManager.h"
#import "SQLiteHelper.h"
#import "AppManager.h"
#import "Note.h"

#define ONE_PIXELS 1/[UIScreen mainScreen].scale
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#ifdef DEBUG
    #define MCLog(...) NSLog(__VA_ARGS__)
#else
    #define MCLog(...) /* */
#endif

@interface Common : NSObject

@end
