//
//  ViewController.m
//  searchDemo
//
//  Created by 刘培策 on 2018/1/20.
//  Copyright © 2018年 UniqueCe. All rights reserved.
//

#import "ViewController.h"
#import "seachController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    seachController *ceach = [seachController new];
    [self.navigationController pushViewController:ceach  animated:YES];
    
}


@end
