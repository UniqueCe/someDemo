//
//  ViewController.m
//  btnCellDemo
//
//  Created by lzhl_iOS on 2017/12/28.
//  Copyright © 2017年 lzhl_iOS. All rights reserved.
//

#import "ViewController.h"
#import "businessCellViewCell.h"


static NSString *cellID = @"btnCellID";

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *table;

@end

@implementation ViewController {
    
    NSArray *_dataSoureStr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.table];
    
    _dataSoureStr = @[
                      @"王者荣耀",
                      @"吃鸡游戏,你吵架分",
                      @"吃呀游戏,我换面的,大家斗鱼",
                      @"吃呀游戏,我换面的,大家斗鱼,YY直播",
                      @"吃呀游戏,我换面的,大家斗鱼,YY直播,龙指出是",
                      @"吃呀游戏,我换面的,大家斗鱼,YY直播,龙指出是,水电费流",
                      @"吃呀游戏,我换面的,大家斗鱼,YY直播,龙指出是,水电费流,水电费流"
                      ];
}

- (UITableView *)table {
    
    if (!_table) {
        _table = [UITableView new];
        _table.delegate = self;
        _table.dataSource = self;
        _table.backgroundColor = [UIColor whiteColor];
        [_table registerClass:[businessCellViewCell class] forCellReuseIdentifier:cellID];
        _table.frame = self.view.bounds;
        _table.tableFooterView = [UIView new];
    }
    return _table;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSoureStr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    businessCellViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.btnStrDataSoure = _dataSoureStr[indexPath.row];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *tmpStr = _dataSoureStr[indexPath.row];
    NSArray *tempArray = [tmpStr componentsSeparatedByString:@","];
    
    return tempArray.count > 4 ? 170 : 130;
}














@end



