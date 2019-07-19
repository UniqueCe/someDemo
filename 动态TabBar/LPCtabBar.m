//
//  LPCtabBar.m
//  仿-不得姐
//
//  Created by 刘培策 on 16/9/9.
//  Copyright © 2016年 刘培策. All rights reserved.


#import "LPCtabBar.h"

@implementation LPCtabBar

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (UIControl *tabBarButton in self.subviews )
    {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

- (void)tabBarButtonClick:(UIButton *)tabBarBut
{
    for (UIView *imageView in tabBarBut.subviews)
    {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")])
        {
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
            animation.duration = 1;
            animation.calculationMode = kCAAnimationCubic;
            [imageView.layer addAnimation:animation forKey:nil];
        }
    }
}



@end
