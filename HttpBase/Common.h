//
//  Common.h
//  HttpBase
//
//  Created by lizhong_zhang on 16/5/18.
//  Copyright © 2016年 lizhong_zhang. All rights reserved.
//

#ifndef Common_h
#define Common_h

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)
#else
#define NSLog(...)
#define debugMethod()
#endif

#ifdef DEBUG

#define CDLog(...) NSLog(__VA_ARGS__)
#else

#define CDLog(...)
#endif

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define kBaseTimeSpan [NSString stringWithFormat:@"%zi", (long long)[[NSDate date]  timeIntervalSince1970]]

// 生成一个字符串
#define CHString(...) [NSString stringWithFormat:__VA_ARGS__]

// 获取用户tonken
#define kTranslateUserToken   [CDCommonTool getUserToken]



#endif /* Common_h */
