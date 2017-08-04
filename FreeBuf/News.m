//
//  News.m
//  FreeBuf
//
//  Created by wubin on 2017/8/4.
//  Copyright © 2017年 clkeji. All rights reserved.
//

#import "News.h"

@implementation News
WDZSERIALIZE_DESCRIPTION()

- (NSMutableArray *)tags{
    if (!_tags) {
        _tags = [NSMutableArray new];
    }
    return _tags;
}
- (NSMutableArray *)look{
    if (!_look) {
        _look = [NSMutableArray new];
    }
    return _look;
}
@end
