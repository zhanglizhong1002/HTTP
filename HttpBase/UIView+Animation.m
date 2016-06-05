//
//  UIView+Animation.m
//  iOS功能汇总
//
//  Created by 陈浩 on 16/4/15.
//  Copyright © 2016年 CD. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)

#pragma mark - 左右抖动动画
- (void)shake
{
    // 抖动
    CAKeyframeAnimation *shakeAnim = [CAKeyframeAnimation animation];
    shakeAnim.keyPath = @"transform.translation.x";
    shakeAnim.duration = 0.15;
    CGFloat delta = 10;
    shakeAnim.values = @[@0, @(-delta), @(delta), @0];
    shakeAnim.repeatCount = 2;
    [self.layer addAnimation:shakeAnim forKey:nil];
}

@end
