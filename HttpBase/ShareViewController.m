//
//  ShareViewController.m
//  HttpBase
//
//  Created by lizhong_zhang on 16/5/31.
//  Copyright © 2016年 lizhong_zhang. All rights reserved.
//

#import "ShareViewController.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKExtension/ShareSDK+Extension.h>
#import <ShareSDKExtension/SSEShareHelper.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
#import <AFNetworking/UIImageView+AFNetworking.h>

#define kScreenWidth             ([[UIScreen mainScreen] bounds].size.width)
#define kScreenHeight            ([[UIScreen mainScreen] bounds].size.height)

@interface ShareViewController ()

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Share";
    self.view.backgroundColor = [UIColor darkGrayColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self shareDynamicDetail:[UIImage imageNamed:@"000"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)shareDynamicDetail:(UIImage *)image{
    
    CGSize size = CGSizeZero;
    if (image.size.width > kScreenWidth/2) {
        size.width = kScreenWidth/2;
        size.height = image.size.height * (kScreenWidth/2) / image.size.width;
    }
    
    image = [self imageWithImage:image scaledToSize:size];
    
    NSData *data = UIImageJPEGRepresentation(image, 0.7);
    image = [UIImage imageWithData:data];
    
    //构造分享参数
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    
    [shareParams SSDKSetupShareParamsByText:@"laozhang"
                                     images:[UIImage imageNamed:@"000"]
                                        url:[NSURL URLWithString:@"http://e.eqxiu.com/s/Xo2yd8Dd?eqrcode=1&from=singlemessage&isappinstalled=0"]
                                      title:@"打一场分享"
                                       type:SSDKContentTypeAuto];
    
    NSMutableArray *shareArr = [NSMutableArray arrayWithCapacity:4];
    
    if ([ShareSDK isClientInstalled:SSDKPlatformSubTypeWechatSession]) {
        [shareArr addObject:@(SSDKPlatformSubTypeWechatSession)];
    }
    
    if ([ShareSDK isClientInstalled:SSDKPlatformSubTypeWechatTimeline]) {
        [shareArr addObject:@(SSDKPlatformSubTypeWechatTimeline)];
    }
    
    if ([ShareSDK isClientInstalled:SSDKPlatformSubTypeQQFriend]) {
        [shareArr addObject:@(SSDKPlatformSubTypeQQFriend)];
    }
    
    if ([ShareSDK isClientInstalled:SSDKPlatformTypeSinaWeibo]) {
        [shareArr addObject:@(SSDKPlatformTypeSinaWeibo)];
    }
    
    [ShareSDK showShareActionSheet:self.view
                             items:shareArr
                       shareParams:shareParams
               onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                   
                   switch (state) {
                           
                       case SSDKResponseStateBegin:
                       {
                           break;
                       }
                       case SSDKResponseStateSuccess:
                       {
                           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                               message:nil
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"确定"
                                                                     otherButtonTitles:nil];
                           [alertView show];
                           break;
                       }
                       case SSDKResponseStateFail:
                       {
                           if (platformType == SSDKPlatformTypeSMS && [error code] == 201)
                           {
                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                               message:@"失败原因可能是：1、短信应用没有设置帐号；2、设备不支持短信应用；3、短信应用在iOS 7以上才能发送带附件的短信。"
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"OK"
                                                                     otherButtonTitles:nil, nil];
                               [alert show];
                               break;
                           }
                           else if(platformType == SSDKPlatformTypeMail && [error code] == 201)
                           {
                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                               message:@"失败原因可能是：1、邮件应用没有设置帐号；2、设备不支持邮件应用；"
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"OK"
                                                                     otherButtonTitles:nil, nil];
                               [alert show];
                               break;
                           }
                           else
                           {
                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                               message:[NSString stringWithFormat:@"%@",error]
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"OK"
                                                                     otherButtonTitles:nil, nil];
                               [alert show];
                               break;
                           }
                           break;
                       }
                       case SSDKResponseStateCancel:
                       {
                           
                           break;
                       }
                       default:
                           break;
                   }
               }];
}


//对图片尺寸进行压缩--
- (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
