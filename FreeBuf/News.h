//
//  News.h
//  FreeBuf
//
//  Created by wubin on 2017/8/4.
//  Copyright © 2017年 clkeji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDZSerializeKit.h"
@interface News : NSObject
@property (nonatomic, copy) NSString *href;
@property (nonatomic, copy) NSString *src;
@property (nonatomic, copy) NSString *headSrc;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *authorHref;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *identityTitle;
@property (nonatomic, copy) NSString *identitySrc;
@property (nonatomic, copy) NSString *identityHref;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) NSMutableArray *tags;
@property (nonatomic, strong) NSMutableArray *look;
@end
