//
//  NewCell.h
//  FreeBuf
//
//  Created by wubin on 2017/8/4.
//  Copyright © 2017年 clkeji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"
@interface NewCell : UITableViewCell
@property (nonatomic, strong) News *news;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
