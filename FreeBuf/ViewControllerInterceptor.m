//
//  ViewControllerInterceptor.m
//  InterceptorDemo
//
//  Created by deng on 16/11/15.
//  Copyright © 2016年 dengyonghao. All rights reserved.
//
#import "ViewControllerInterceptor.h"
#import "Aspects.h"
#import <UIKit/UIKit.h>
#import "CYLTabBarControllerConfig.h"

@implementation ViewControllerInterceptor

// 会在应用启动的时候自动被runtime调用，通过这个方法可以实现代码的注入
+ (void)load {
    [super load];
    [ViewControllerInterceptor sharedInstance];
}

// 单例
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static ViewControllerInterceptor *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ViewControllerInterceptor alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    if ([super init]) {
         // 使用 Aspects 进行方法的拦截
         // AspectOptions 三种方式选择：在原本方法前执行、在原本方法后执行、替换原本方法
        [CYLBaseNavigationController aspect_hookSelector:@selector(pushViewController:animated:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> aspectInfo, UIViewController *vc ,BOOL animated) {
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
            backItem.title = @"返回";
            vc.navigationItem.backBarButtonItem = backItem;
            NSLog(@"控制器 %@ 将要显示: %tu", vc, animated);
        } error:nil];
    }
    return self;
}


@end
