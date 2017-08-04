//
//  IndexViewController.m
//  FreeBuf
//
//  Created by wubin on 2017/8/3.
//  Copyright © 2017年 clkeji. All rights reserved.
//
#import "NewCell.h"
#import "IndexViewController.h"

@interface IndexViewController ()
@end

@implementation IndexViewController
int pageNum = 0;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshData];
}
- (void)refreshData{
    [self.dataSource removeAllObjects];
    pageNum = 0;
    [self loadMoreData];
}
- (void)loadMoreData{
    [WDZAFNetworking get:[NSString stringWithFormat:@"%@%d",IndexServerName,pageNum+1] parameters:nil success:^(id  _Nonnull json) {
        TFHpple *doc = [[TFHpple alloc] initWithHTMLData:json];
        NSArray * elements  = [doc searchWithXPathQuery:@"//div[@class='news_inner news-list']"];
        if (elements.count > 0) {
            pageNum++;
        }
        [elements enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            News *news = [News new];
            TFHppleElement *element = obj;
            
            TFHppleElement *img = [[[element firstChildWithClassName:@"news-img"] firstChildWithTagName:@"a"] firstChildWithTagName:@"img"];
            news.src = [img objectForKey:@"src"];
            
            TFHppleElement *newsInfoDl = [[element firstChildWithClassName:@"news-info"] firstChildWithTagName:@"dl"];
            TFHppleElement *title = [[newsInfoDl  firstChildWithTagName:@"dt"] firstChildWithTagName:@"a"];
            news.title = [title objectForKey:@"title"];
            news.href = [title objectForKey:@"href"];
            
            TFHppleElement *nameHead = [[newsInfoDl firstChildWithTagName:@"dd"] firstChildWithClassName:@"name-head"];
            news.headSrc = [[nameHead firstChildWithTagName:@"img"] objectForKey:@"src"];
            news.author = [nameHead firstChildWithTagName:@"a"].text;
            news.authorHref = [[nameHead firstChildWithTagName:@"a"] objectForKey:@"href"];
            
            TFHppleElement *identity = [[newsInfoDl firstChildWithTagName:@"dd"] firstChildWithClassName:@"identity"];
            news.identityTitle = [[[identity firstChildWithTagName:@"a"] firstChildWithTagName:@"img"] objectForKey:@"title"];
            news.identitySrc = [[[identity firstChildWithTagName:@"a"] firstChildWithTagName:@"img"] objectForKey:@"src"];
            news.identityHref = [[identity firstChildWithTagName:@"a"] objectForKey:@"href"];
            
            NSString *time = [[newsInfoDl firstChildWithTagName:@"dd"] firstChildWithClassName:@"time"].text;
            news.time = [NSString removeWhiteCharacterWithString:time];
            
            NSString *text = [newsInfoDl firstChildWithClassName:@"text"].text;
            news.text = [NSString removeWhiteCharacterWithString:text];
            
            NSArray *tagArray = [[[[element firstChildWithClassName:@"news-info"] firstChildWithClassName:@"news_bot"] firstChildWithClassName:@"tags"] childrenWithTagName:@"a"];
            [tagArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                TFHppleElement *tagElement = obj;
                Tag *tag = [Tag new];
                tag.name = tagElement.text;
                tag.href = [tagElement objectForKey:@"href"];
                [news.tags addObject:tag];
            }];
            
            NSArray *lookArray = [[[[element firstChildWithClassName:@"news-info"] firstChildWithClassName:@"news_bot"] firstChildWithClassName:@"look"] childrenWithTagName:@"strong"];
            WLog(@"%@",lookArray);
            [lookArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                TFHppleElement *tagElement = obj;
                [news.look addObject:tagElement.text];
            }];
            [self.dataSource addObject:news];
        }];
        WLog(@"%@",self.dataSource);
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
@end
