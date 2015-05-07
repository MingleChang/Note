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
#define ONE_PIXELS 1/[UIScreen mainScreen].scale
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
@interface Common : NSObject

@end
