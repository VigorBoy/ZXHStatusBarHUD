
//  ZXHStatusBarHUD
//
//  Created by    🐯 on 16/1/30.
//  Copyright © 2016年 张炫赫. All rights reserved.
//

#import "ZXHStatusBarHUD.h"

#define ZXHMessageFont [UIFont systemFontOfSize:12]

/** 消息的停留时间 */
static CGFloat const ZXHMessageDuration = 2.0;
/** 消息显示\隐藏的动画时间 */
static CGFloat const ZXHAnimationDuration = 0.25;

@implementation ZXHStatusBarHUD

/** 全局的窗口 */
static UIWindow *window_;
/** 定时器 */
static NSTimer *timer_;

/** 显示窗口 */
+(void)showWindow
{
    // frame数据
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    // 显示窗口
    window_.hidden = YES;//必写
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    
    // 动画
    frame.origin.y = 0;
    [UIView animateWithDuration:ZXHAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

/**
 * 显示普通信息
 * @param msg       文字
 * @param image     图片
 */
+(void)ZXH_showMessage:(NSString *)msg image:(UIImage *)image
{
    // 停止定时器
    [timer_ invalidate];
    
    //显示窗口
    [self showWindow];
    
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = ZXHMessageFont;
    if (image) { // 如果有图片
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    // 定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:ZXHMessageDuration target:self selector:@selector(ZXH_hide) userInfo:nil repeats:NO];
}

/** 显示普通信息 */
+(void)ZXH_showMessage:(NSString *)msg
{
    [self ZXH_showMessage:msg image:nil];
}

/** 显示成功信息 */
+(void)ZXH_showSuccess:(NSString *)msg
{
    //打印沙河路径
    NSLog(@"%@", NSTemporaryDirectory());
    [self ZXH_showMessage:msg image:[UIImage imageNamed:@"ZXHStatusBarHUD.bundle/success"]];
}

/** 显示失败信息 */
+(void)ZXH_showError:(NSString *)msg
{
    [self ZXH_showMessage:msg image:[UIImage imageNamed:@"ZXHStatusBarHUD.bundle/error"]];
}

/** 显示正在处理信息 */
+(void)ZXH_showLoading:(NSString *)msg
{
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    // 显示窗口
    [self showWindow];
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = ZXHMessageFont;
    label.frame = window_.bounds;
    //文字剧中
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    // 添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    //想让它出来就要调用下面👇这段话  开始动画
    [loadingView startAnimating];
    // 文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : ZXHMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
    
//    // 定时器
//    timer_ = [NSTimer scheduledTimerWithTimeInterval:ZXHMessageDuration target:self selector:@selector(ZXH_hide) userInfo:nil repeats:NO];
}

/** 隐藏 */
+(void)ZXH_hide
{
    [UIView animateWithDuration:ZXHAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y =  - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}
@end