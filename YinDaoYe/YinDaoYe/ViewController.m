//
//  ViewController.m
//  YinDaoYe
//
//  Created by lzhl_iOS on 2017/3/21.
//  Copyright © 2017年 lzhl_iOS_LPC. All rights reserved.
//

#import "ViewController.h"
#import "bootView.h"
#import "Masonry.h"

#define DelayTime 5
#define AnimateTime 0.5

/**
    引导页。。。有待改善！！！！
 */

@interface ViewController ()

@property(nonatomic, strong) UIButton *button;

@property(nonatomic, strong) bootView *bootViewPage;

@property (weak, nonatomic) IBOutlet UIImageView *tupian;

@property(nonatomic, weak) NSTimer *timer;

@property(nonatomic, assign) NSInteger count;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    [self setupUI];
    
    [self setupView];
    
    [self setWindowButton];
}

- (void)setupUI {
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"猴怪"];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(10);
    }];
    
    UIImageView *imageView2 = [[UIImageView alloc] init];
    imageView2.image = [UIImage imageNamed:@"喵猫"];
    [self.view addSubview:imageView2];
    [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.tupian.mas_bottom).offset(10);
    }];
    
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
    _count = DelayTime;
}

- (void)setupView {
    
    bootView *boot = [[bootView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.bootViewPage = boot;
    [[UIApplication sharedApplication].keyWindow addSubview:boot];
}

- (void)setWindowButton {
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width-100, self.view.bounds.size.height-80, 80, 40)];
    self.button = btn;
    [btn setBackgroundColor:[UIColor lightGrayColor]];
    [btn addTarget:self action:@selector(QuickRemoveBootViewPageAnimate) forControlEvents:UIControlEventTouchUpInside];
    [self.button setTitle:@"5" forState:UIControlStateNormal];
    btn.layer.cornerRadius = 10;
    btn.layer.masksToBounds = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:btn];
}

//MARK:正常删除
- (void)RemoveBootViewPageAnimate {
    
    [UIView animateWithDuration:AnimateTime delay:DelayTime options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [self.button removeFromSuperview];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
            self.bootViewPage.alpha = 0;
            [_timer invalidate];
        });
        
    } completion:^(BOOL finished) {
        
        [self.button removeFromSuperview];
        [self.bootViewPage removeFromSuperview];
    }];
}

//MARK:快速删除
- (void)QuickRemoveBootViewPageAnimate {

    [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.button.hidden = YES;
        self.bootViewPage.alpha = 0;
        [_timer invalidate];
        
    } completion:^(BOOL finished) {
        
        [self.button removeFromSuperview];
        [self.bootViewPage removeFromSuperview];
    }];
}

- (void)timeAction {
    
    --_count;
    
    if (_count == 0) {
        [self RemoveBootViewPageAnimate];
    }else {
        [self.button setTitle:[NSString stringWithFormat:@"%lu",_count] forState:UIControlStateNormal];
    }
}

@end
