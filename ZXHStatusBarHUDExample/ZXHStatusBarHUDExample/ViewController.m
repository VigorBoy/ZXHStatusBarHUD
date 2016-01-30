//
//  ViewController.m
//  ZXHStatusBarHUDExample
//
//  Created by    🐯 on 16/1/30.
//  Copyright © 2016年 张炫赫. All rights reserved.
//

#import "ViewController.h"
#import "ZXHStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)success {
    [ZXHStatusBarHUD ZXH_showSuccess:@"加载成功！"];
}

- (IBAction)error {
    [ZXHStatusBarHUD ZXH_showError:@"加载失败!"];
}

- (IBAction)loading {
    [ZXHStatusBarHUD ZXH_showLoading:@"正在加载中..."];
}

- (IBAction)hide {
    [ZXHStatusBarHUD ZXH_hide];
}

- (IBAction)message {
    [ZXHStatusBarHUD ZXH_showMessage:@"没有什么事!!!!" image:[UIImage imageNamed:@"check"]];
}
- (IBAction)Messager {
    [ZXHStatusBarHUD ZXH_showMessage:@"哈哈哈"];
}

@end
