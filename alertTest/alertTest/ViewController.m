//
//  ViewController.m
//  alertTest
//
//  Created by 刘培策 on 2018/1/19.
//  Copyright © 2018年 UniqueCe. All rights reserved.
//

#import "ViewController.h"
#import "alertButtonView.h"

@interface ViewController ()

@end

@implementation ViewController {
    UILabel *na;
}

- (void)viewDidLoad {
    [super viewDidLoad];

     na = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 80)];
    [self.view addSubview:na];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    alertButtonView *alert = [alertButtonView new];
    alert.leftLabel.text = @"name";
    alert.rightLabel.text = @"$9999000";
    [alert showsAlertView];
    
    alert.numBlock = ^(NSInteger num) {
        NSLog(@"%lu",num);
        na.text = [NSString stringWithFormat:@"%lu",num];
    };
}


@end
