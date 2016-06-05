//
//  CDHttpInfo.h
//  HttpBase
//
//  Created by lizhong_zhang on 16/5/18.
//  Copyright © 2016年 lizhong_zhang. All rights reserved.
//

#ifndef CDHttpInfo_h
#define CDHttpInfo_h

#define kUserRequestUrl CHString(@"%@",@"user/")

#define kBindCustomInfoRequestUrl             CHString(@"%@",@"user/bind.json")//绑定用户信息

#define kGetUserNoticeMessageUrl          CHString(@"%@%@?token=%@",kUserRequestUrl,@"message.json",@"7c9114b7524145e73e127bb3fe6bac96")//通知消息

//c802b8fe137c38bc2ce4cda721c1a248
#endif /* CDHttpInfo_h */
