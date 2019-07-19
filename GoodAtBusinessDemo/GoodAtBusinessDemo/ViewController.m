//
//  ViewController.m
//  GoodAtBusinessDemo
//
//  Created by 刘培策 on 2018/1/1.
//  Copyright © 2018年 UniqueCe. All rights reserved.
//

#import "ViewController.h"
#import "businessViewCell.h"
#import "Masonry.h"
#import "ButtonView.h"

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define Nav_Height 64

static NSString *businessViewCellID = @"businessViewCellID";

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *table;

@property(nonatomic,strong) UIView *chesoBtnView;

@property(nonatomic,strong) UILabel *chesoLabel;

@property(nonatomic,strong) ButtonView *btnView;

@end

@implementation ViewController {
    
    NSArray *_dataSoure;
    NSArray *_headerDataSoure;
    int _choseHeight;
    
    //存储选中的业务
    NSMutableArray *_tempMArray;
    int _row; //行
    //判断是否进行过删除
    BOOL _isDelete;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tempMArray = [NSMutableArray array];

    [self.view addSubview:self.table];
    self.table.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    _dataSoure = @[
                   @[@"外部审计",@"内部稽核",@"我就差你",@"内部审计",@"内部哈核",@"擦就差你",@"借口审计",@"内部看来",@"我啊的你"],
                   @[@"外部审计",@"极乐稽核",@"我看差你",@"内部兰蔻",@"外部见客",@"内部撒啊",@"我是差你",@"我们审计",@"内部无法",@"但就差你",@"我去审计",@"内部欧赔",@"去就差你"],
                   @[@"外部审计",@"内部稽核",@"我就差你",@"内部稽核",@"内部稽核",@"外部审计",@"内部稽核",@"我就差你",@"外部审计",@"内部稽核",@"我就差你",@"外部审计",@"内部稽核",@"我就差你"],
                   @[@"外部审计",@"内部稽核",@"我就差你",@"外部审计",@"内部稽核",@"我就差你",@"外部审计",@"内部稽核",@"我就差你",@"外部审计",@"内部稽核",@"我就差你",@"外部审计",@"内部稽核",@"我就差你"],
                   @[@"外部审计",@"内部稽核",@"我就差你",@"外部审计",@"内部稽核",@"我就差你",@"外部审计",@"内部稽核",@"我就差你",@"外部审计",@"内部稽核",@"我就差你"],
                   @[@"外部审计",@"内部稽核",@"我就差你",@"外部审计",@"内部稽核",@"外部审计",@"内部稽核",@"我就差你",@"外部审计",@"内部稽核",@"我就差你"],
                   @[@"外部审计",@"内部稽核",@"我就差你",@"外部审计",@"内部稽核",@"我就差你",@"外部审计",@"内部稽核",@"我就差你"]
                   ];
    
    _headerDataSoure = @[
                         @"审计",@"评估",@"审计",@"评估",@"审计",@"评估",@"审计"
                         ];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(choseViewHeight:) name:@"choseBtnNotificationName" object:nil];
}

- (void)choseViewHeight:(NSNotification *)action {
    
    _row = 1;
    _isDelete = NO;
    //---把选中的标签进行处理---↓--
    if (_tempMArray.count > 0) {
        
        for (int i = 0; i < _tempMArray.count; i++) {
            if (_tempMArray[i] == action.userInfo[@"Height"]) {
                [_tempMArray removeObject:action.userInfo[@"Height"]];
                _isDelete = YES;
            }
        }
    }
    
    //---把选中的标签进行处理---↑--
    
    if (_isDelete == NO) {
        
        [_tempMArray addObject: action.userInfo[@"Height"]];
    }
    
    //---根据标签的个数返回一定的高度---↓--
    for (int i = 0; i < _tempMArray.count; i++) {
        if (i % 3 == 0 && i != 0) {
            _row += 1;
        }
    }
    
    if (_tempMArray.count == 0) {
        _row = 0;
    }
    
    _choseHeight = _row * 30+_row * 10 +65;

    self.chesoBtnView.frame = CGRectMake(0, Nav_Height, [UIScreen mainScreen].bounds.size.width, _choseHeight);
    [self.view addSubview:self.chesoBtnView];
    [self.chesoBtnView addSubview:self.chesoLabel];
    self.chesoLabel.frame = CGRectMake(15, 15, 100, 30);
    
    self.table.frame = CGRectMake(0, _choseHeight+Nav_Height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-self.chesoBtnView.frame.size.height);
    
    [self.btnView removeFromSuperview];
    
    self.btnView = [ButtonView new];
    self.btnView.backgroundColor = [UIColor whiteColor];
    self.btnView.frame = CGRectMake(0, Nav_Height, [UIScreen mainScreen].bounds.size.width, _row * 30+_row*10);
    self.btnView.choseBtnMArray = _tempMArray;
    [self.chesoBtnView addSubview:self.btnView];
    
    if (_tempMArray.count == 0) {
        [self.chesoBtnView removeFromSuperview];
        self.table.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    }
    NSLog(@"_tempMArray = %@",_tempMArray);
}

- (UIView *)chesoBtnView {
    
    if (!_chesoBtnView) {
        _chesoBtnView = [UIView new];
        _chesoBtnView.backgroundColor = [UIColor redColor];
    }
    return  _chesoBtnView;
}

- (UILabel *)chesoLabel {
    
    if (!_chesoLabel) {
        _chesoLabel = [UILabel new];
        _chesoLabel.text = @"已选";
        _chesoLabel.backgroundColor = [UIColor whiteColor];
    }
    return  _chesoLabel;
}

- (UITableView *)table {
    
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, _chesoBtnView.frame.size.height, 0, 0) style:UITableViewStyleGrouped];
        _table.delegate = self;
        _table.dataSource = self;
        _table.backgroundColor = [UIColor whiteColor];
//        _table.frame = self.view.bounds;
        _table.tableFooterView = [UIView new];
        
        [_table registerClass:[businessViewCell class] forCellReuseIdentifier:businessViewCellID];
    }
    return _table;
}

/** UITableViewDelegate,UITableViewDataSource */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataSoure.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    businessViewCell *cell = [[businessViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:businessViewCellID];
    cell.dataSoureArray = _dataSoure[indexPath.section];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    int row = 0;
    
    for (int i = 0; i < [_dataSoure[indexPath.section] count]; i++) {

        if (i % 4 == 0 && i != 0) {
            row += 1;
        }
    }
    return row * 30 + 30+(row == 0 ? 0:row - 1)*5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 35;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor grayColor];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor redColor];
    [headerView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView.mas_left).offset(15);
        make.top.equalTo(headerView.mas_top).offset(5);
        make.bottom.equalTo(headerView.mas_bottom).offset(-5);
        make.width.mas_equalTo(5);
    }];
    
    UILabel *la = [UILabel new];
    la.font = [UIFont systemFontOfSize:15];
    [headerView addSubview:la];
    [la mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(headerView.mas_centerY);
        make.left.equalTo(lineView.mas_right).offset(15);
    }];
    
    la.text = _headerDataSoure[section];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    return [UIView new];
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end
