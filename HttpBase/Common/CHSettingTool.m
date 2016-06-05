//
//  CHSettingTool.m
//  号外 - CH
//
//  Created by ch736419929 on 15/1/6.
//  Copyright (c) 2015年 CH. All rights reserved.
//

#import "CHSettingTool.h"

@implementation CHSettingTool

+ (id)objectForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)boolForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:defaultName];
}

+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
