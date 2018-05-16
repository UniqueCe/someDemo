//
//  bootView.m
//  YinDaoYe
//
//  Created by lzhl_iOS on 2017/3/21.
//  Copyright © 2017年 lzhl_iOS_LPC. All rights reserved.
//

#import "bootView.h"
#import "Masonry.h"

@implementation bootView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if ([super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.backgroundColor = [UIColor redColor];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"猴怪"];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
    }];
   
    UIImageView *imageView2 = [[UIImageView alloc] init];
    imageView2.image = [UIImage imageNamed:@"喵猫"];
    [self addSubview:imageView2];
    [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(imageView.mas_top).offset(-30);
    }];
    
    UIImageView *imageView3 = [[UIImageView alloc] init];
    imageView3.image = [UIImage imageNamed:@"照相机"];
    [self addSubview:imageView3];
    [imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(imageView.mas_bottom).offset(30);
    }];
}

@end
