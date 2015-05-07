//
//  NSDate+MCDateExtension.m
//  Note
//
//  Created by 常峻玮 on 15/5/7.
//  Copyright (c) 2015年 Mingle. All rights reserved.
//

#import "MCDateExtension.h"

@implementation NSDate (Extension)
-(NSString *)stringFromFormat:(NSString *)format{
    NSDateFormatter *lDateFormatter=[[NSDateFormatter alloc]init];
    [lDateFormatter setDateFormat:format];
    return [lDateFormatter stringFromDate:self];
}
@end
