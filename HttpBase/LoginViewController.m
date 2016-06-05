//
//  LoginViewController.m
//  HttpBase
//
//  Created by lizhong_zhang on 16/5/31.
//  Copyright © 2016年 lizhong_zhang. All rights reserved.
//

#import "LoginViewController.h"
#import "ShareViewController.h"


#import <MOBFoundation/MOBFoundation.h>
#import <MOBFoundation/MOBFImageService.h>
#import <ShareSDKExtension/ShareSDK+Extension.h>
#import <ShareSDKExtension/SSEThirdPartyLoginHelper.h>
//腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/QQApiInterface.h>

//微信SDK头文件
#import "WXApi.h"

//新浪微博SDK头文件
#import "WeiboSDK.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Login";
    
    self.view.backgroundColor = [UIColor purpleColor];
}


- (IBAction)shareAction:(id)sender {
    
    ShareViewController *VC = [[ShareViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}



- (IBAction)clickThreePart:(UIButton *)sender {
    UIButton *btn = (UIButton *)sender;
    
    SSDKPlatformType type;
    
    NSInteger sourceType;
    
    if (btn.tag == 1) {
        type = SSDKPlatformTypeQQ;
        sourceType = 0;
        if (![QQApi isQQInstalled]) {
//            [GlobalMethods showTextHUD:@"没有对应客户端" andView:self.view maintainTime:2.0f];
            [CDCommonTool showErrorWithStatus:@"没有对应客户端"];
        }
        
    }
    else if (btn.tag == 3){
        type = SSDKPlatformTypeSinaWeibo;
        sourceType = 1;
        if (![WeiboSDK isWeiboAppInstalled]) {
//            [GlobalMethods showTextHUD:@"没有对应客户端" andView:self.view maintainTime:2.0f];
            [CDCommonTool showErrorWithStatus:@"没有对应客户端"];
        }
    }
    else{
        type = SSDKPlatformTypeWechat;
        sourceType = 2;
        if (![WXApi isWXAppInstalled]) {
//            [GlobalMethods showTextHUD:@"没有对应客户端" andView:self.view maintainTime:2.0f];
            [CDCommonTool showErrorWithStatus:@"没有对应客户端"];
        }
        
    }
    
    
    [SSEThirdPartyLoginHelper loginByPlatform:type
                                   onUserSync:^(SSDKUser *user, SSEUserAssociateHandler associateHandler) {
                                       
                                       //在此回调中可以将社交平台用户信息与自身用户系统进行绑定，最后使用一个唯一用户标识来关联此用户信息。
                                       //在此示例中没有跟用户系统关联，则使用一个社交用户对应一个系统用户的方式。将社交用户的uid作为关联ID传入associateHandler。
                                       associateHandler (user.uid, user, user);
                                       
                                       NSLog(@"%@",[user credential]);
                                       if (user) {
                                           
                                           //保存token, source icon 以便自动登录
//                                           [[CommonTool sharedInstance] setUserAccountName:user.nickname];
//                                           [[CommonTool sharedInstance] setLoginStyle:[NSNumber numberWithInt:enumlogintypeThreeParty]];
//                                           [[CommonTool sharedInstance] setLoginSource:[NSNumber numberWithInteger:sourceType]];
//                                           [[CommonTool sharedInstance] setThreePartyIcon:user.icon];
//                                           
//                                           [_autoLogin autoLoginStyle:enumlogintypeThreeParty];
                                           
                                           NSLog(@"------->%@---%@", user.icon, user.nickname);
                                           
                                       }
                                       
                                   }
                                onLoginResult:^(SSDKResponseState state, SSEBaseUser *user, NSError *error) {
                                    
                                    if (state == SSDKResponseStateSuccess)
                                    {
                                        NSLog(@"users %@",user);
                                        
                                    }
                                    
                                }];
    
    
    

}



@end
