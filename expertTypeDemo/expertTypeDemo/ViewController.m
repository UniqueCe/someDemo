//
//  ViewController.m
//  expertTypeDemo
//
//  Created by 刘培策 on 2018/1/6.
//  Copyright © 2018年 UniqueCe. All rights reserved.
//

#import "ViewController.h"
#import "expertTypeView.h"

#define kSconfirmBtnArrayName  @"kSconfirmBtnArrayName"

@interface ViewController ()

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];

    NSArray *tempArray = @[@"吐槽大火",@"吐槽ad",@"吐槽阿斯",@"吐槽按位",@"阿萨德了",@"大飞机航",@"IOP立刻减肥",@"兰蔻水电"];
    
    int row = 1;
    for (int i = 0; i < tempArray.count; i++) {
        if (i % 3 == 0 && i != 0) {
            row += 1;
        }
    }
    
    expertTypeView *expert = [[expertTypeView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 115+row*40)];
    expert.rowNum = row;
    expert.btnStrArray = tempArray;
    [self.view addSubview:expert];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shuju:) name:kSconfirmBtnArrayName object:nil];
    
}

- (void)shuju:(NSNotification *)action {
    
    NSLog(@"shuju %@",action.userInfo[@"confirm"]);
    NSArray *te = action.userInfo[@"confirm"];
    UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(10, 380, 300, 100)];
    la.text =  [te componentsJoinedByString:@","];
    la.backgroundColor = [UIColor yellowColor];
    la.numberOfLines = 0;
    [self.view addSubview:la];
}

@end
