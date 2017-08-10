//
//  NewsDetailViewController.m
//  FreeBuf
//
//  Created by 吴斌 on 2017/8/5.
//  Copyright © 2017年 clkeji. All rights reserved.
//
#import <WebKit/WebKit.h>
#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()
@end

@implementation NewsDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.news.href]]];
    [self.view addSubview:webView];
    // Do any additional setup after loading the view from its nib.
//    [WDZAFNetworking get:self.news.href parameters:nil success:^(id  _Nonnull json) {
//        TFHpple *doc = [[TFHpple alloc] initWithHTMLData:json];
//        TFHppleElement *content = [doc peekAtSearchWithXPathQuery:@"//div[@id='contenttxt']"];
//        [webView loadHTMLString:content.raw baseURL:nil];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    } loadingMsg:nil errorMsg:nil];
}

@end
