//
//  NewCell.m
//  FreeBuf
//
//  Created by wubin on 2017/8/4.
//  Copyright © 2017年 clkeji. All rights reserved.
//

#import "NewCell.h"
#import <UIButton+WebCache.h>
#import <UIImageView+WebCache.h>
@interface NewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end

@implementation NewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"NewCell";
    NewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"NewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
- (void)setNews:(News *)news{
    _news = news;
    [self.headImg sd_setImageWithURL:[NSURL URLWithString:news.headSrc] placeholderImage:[UIImage imageNamed:@""]];
    self.author.text = news.author;
    self.text.text = news.text;
    self.time.text = news.time;
    self.title.text = news.title;
    WLog(@"%@",news.headSrc);
    [self.img sd_setImageWithURL:[NSURL URLWithString:news.src] placeholderImage:[UIImage imageNamed:@""]];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
