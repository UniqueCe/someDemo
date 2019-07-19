//
//  ViewController.m
//  CustomCellDeleteView
//
//  Created by Tianlong on 2017/9/26.
//  Copyright © 2017年 Tianlong. All rights reserved.
//

#import "ViewController.h"
#import "TestCell.h"
#import "Masonry.h"

#define PYKRandomColor [UIColor colorWithRed:(arc4random_uniform(256) / 255.0) green:(arc4random_uniform(256) / 255.0) blue:(arc4random_uniform(256) / 255.0) alpha:1.0]

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak) UITableView *tableView;
@end

@implementation ViewController

static NSString *cellId = @"TestCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
}

-(void)setupTableView{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64) style:UITableViewStylePlain];
    self.tableView = tableView;
    self.tableView.delegate       = self;
    self.tableView.dataSource     = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[TestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;//189px
}

#pragma mark - 左滑删除
//ios8之前的删除操作写这里
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TestCell *animateCell = [tableView cellForRowAtIndexPath:indexPath];
    //取出侧滑视图被点击的点
    CGPoint p = [tableView.panGestureRecognizer locationInView:animateCell.deleteV];
    if (CGRectContainsPoint(animateCell.deleteV.firstB.frame, p)) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"可以换成ImageView" delegate:nil cancelButtonTitle:@"done" otherButtonTitles:nil, nil];
        [alert show];
        
    }else if (CGRectContainsPoint(animateCell.deleteV.secondB.frame, p)){
        //点击了删除
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"点击了删除" delegate:nil cancelButtonTitle:@"done" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
        //如果你定义了多个同样可以根据点击区域来区分点击了哪个按钮
    }
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

/**
 *  返回的文字长度越长，删除控件显示的区域越大
 */
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"   删除 修改动画标题   ";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
