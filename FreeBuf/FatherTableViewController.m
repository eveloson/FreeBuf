//
//  NodeFatherViewController.m
//  AutoLayout
//
//  Created by wubin on 2017/6/2.
//  Copyright © 2017年 wubin. All rights reserved.
//

#import "FatherTableViewController.h"

@interface FatherTableViewController ()
@property (nonatomic, weak) UILabel *noDataLabel;
@end

@implementation FatherTableViewController
@synthesize dataSource = _dataSource;
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
}
- (void)setDataSource:(NSMutableArray *)dataSource{
    _dataSource = dataSource;
    if (dataSource.count) {
        self.noDataLabel.hidden = YES;
    } else {
        self.noDataLabel.hidden = NO;
    }
//    if ( dataSource.count < [Pagesize integerValue]) {
//        self.tableView.mj_footer.hidden = YES;
//    } else {
//        self.tableView.mj_footer.hidden = NO;
//    }
    [self.tableView reloadData];
}
- (void)refreshData{
    
}
- (void)loadMoreData{
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.tableView.backgroundColor = RGB(240, 240, 240);
    self.tableView.mj_footer.hidden = YES;
    UILabel *noDataLabel  = [UILabel new];
    noDataLabel.frame = self.tableView.bounds;
    noDataLabel.text = @"没有获取到数据，请下拉加载重试";
    noDataLabel.backgroundColor = [UIColor clearColor];
    noDataLabel.textAlignment = NSTextAlignmentCenter;
    noDataLabel.hidden = YES;
    self.noDataLabel = noDataLabel;
    [self.tableView addSubview:noDataLabel];
    //    self.tableView.backgroundColor = [UIColor whiteColor];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
}
@end
