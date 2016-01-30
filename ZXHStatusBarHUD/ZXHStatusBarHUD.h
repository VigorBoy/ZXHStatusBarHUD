//
//  ZXHStatusBarHUD.h
//  ZXHStatusBarHUD
//
//  Created by    🐯 on 16/1/30.
//  Copyright © 2016年 张炫赫. All rights reserved.
//
//  大版本号.功能更新版本号.BUG修复版本号
//  0.0.0

#import <UIKit/UIKit.h>

@interface ZXHStatusBarHUD : NSObject
/**
 * 显示普通信息
 * @param msg       文字
 * @param image     图片
 */
+ (void)ZXH_showMessage:(NSString *)msg image:(UIImage *)image;
/**
 * 显示普通信息
 */
+ (void)ZXH_showMessage:(NSString *)msg;
/**
 * 显示成功信息
 */
+ (void)ZXH_showSuccess:(NSString *)msg;
/**
 * 显示失败信息
 */
+ (void)ZXH_showError:(NSString *)msg;
/**
 * 显示正在处理的信息
 */
+ (void)ZXH_showLoading:(NSString *)msg;
/**
 * 隐藏
 */
+ (void)ZXH_hide;
@end
