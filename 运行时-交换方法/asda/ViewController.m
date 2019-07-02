//
//  ViewController.m
//  asda
//
//  Created by lzhl_iOS on 2018/10/30.
//  Copyright © 2018年 lzhl_iOS. All rights reserved.
//

#import "ViewController.h"
#import "aaaaViewController.h"
#import "Masonry.h"
#import "Header.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"Do any additional setup after loading the view, typically from a nib. %@ ",self);
    self.view.backgroundColor = [UIColor yellowColor];
    
    
    UIButton *btn = [[UIButton alloc] init];
    btn.backgroundColor = [UIColor redColor];
    btn.layer.masksToBounds = true;
    btn.layer.cornerRadius = 25.0f;
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(15);
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.bottom.equalTo(self.view.mas_bottom).offset(-100);
        make.height.mas_equalTo(50);
    }];

    dispatchAfter(^{
        drawGradientLayerColor(@[(__bridge id)[UIColor colorWithRed:255/255.0 green:152/255.0 blue:77/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:235/255.0 green:105/255.0 blue:75/255.0 alpha:1.0].CGColor], @[@0.0, @1.0], btn.frame, self.view);
    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.navigationController pushViewController:[aaaaViewController new] animated:true];
}



@end
