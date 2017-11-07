//
//  ZJAutoStatusNavigationController.m
//  AutoStatusDemo
//
//  Created by Maple on 2017/11/7.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "ZJAutoStatusNavigationController.h"

@interface ZJAutoStatusNavigationController ()

@end

@implementation ZJAutoStatusNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}
//如果页面中套有navigationController 必须重写这个
-(UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}

@end
