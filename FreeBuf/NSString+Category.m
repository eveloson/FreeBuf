//
//  NSString+Category.m
//  FreeBuf
//
//  Created by wubin on 2017/8/4.
//  Copyright © 2017年 clkeji. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)
+ (NSString *)removeWhiteCharacterWithString:(NSString *)str{
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    return str;
}
@end
