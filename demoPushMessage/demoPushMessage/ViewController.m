//
//  ViewController.m
//  demoPushMessage
//
//  Created by 郑晖 on 2018/1/16.
//  Copyright © 2018年 Hui Zheng. All rights reserved.
//

#import "ViewController.h"
#import "MessageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    MessageViewController *messageVC = [MessageViewController new];
    [self.navigationController pushViewController:messageVC animated:YES];
}


@end
