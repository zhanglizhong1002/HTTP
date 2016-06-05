//
//  HarpyConstants.h
//  
//
//  Created by Arthur Ariel Sabintsev on 1/30/13.
//
//

//*******#warning Please customize Harpy's static variables

/*
 Option 1 (DEFAULT): NO gives user option to update during next session launch
 Option 2: YES forces user to update app on launch
 */
//static BOOL harpyForceUpdate = NO;

// 2. Your AppID (found in iTunes Connect)
//#define kHarpyAppID                 @"689702808"

// 3. Customize the alert title and action buttons

#define kYQGUpdateMessage(version)        CHString(@"发现新版本:%@",version)
//#define kUpDateLater                @"以后再说"
//#define kUpDateSomeDayLater         @"下次提醒"
//#define kUpDateRightNow             @"马上更新"
#define kUpDateLater                    @"暂不更新"
#define kUpDateRightNow             @"立即更新"
