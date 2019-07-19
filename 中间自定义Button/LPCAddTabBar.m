//
//  LPCAddTabBar.m
//  黑微博-OC
//
//  Created by 刘培策 on 16/9/21.
//  Copyright © 2016年 刘培策. All rights reserved.
//

#import "LPCAddTabBar.h"


@interface LPCAddTabBar ()

@property(nonatomic,weak)UIButton *but;

@end

@implementation LPCAddTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}
- (void)setupUI
{
    UIButton *addBut = [[UIButton alloc]init];
    self.but = addBut;
    
    [addBut setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
    [addBut setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];

    [addBut sizeToFit];

    [addBut addTarget:self action:@selector(gotoVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:addBut];
}

//重写hitTest方法，去监听发布按钮的点击，目的是为了让凸出的部分点击也有反应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    //这一个判断是关键，不判断的话push到其他页面，点击发布按钮的位置也是会有反应的，这样就不好了
    //self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
    //在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在发布按钮身上
    //是的话让发布按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
    if (self.isHidden == NO) {
        
        //将当前tabbar的触摸点转换坐标系，转换到发布按钮的身上，生成一个新的点
        CGPoint newP = [self convertPoint:point toView:self.but];
        
        //判断如果这个新的点是在发布按钮身上，那么处理点击事件最合适的view就是发布按钮
        if ( [self.but pointInside:newP withEvent:event]) {
            return self.but;
        }else{//如果点不在发布按钮身上，直接让系统处理就可以了
            return [super hitTest:point withEvent:event];
        }
    }
    else {//tabbar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
        return [super hitTest:point withEvent:event];
    }
}
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.but.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2- 20);
    
    NSInteger itemWidth = self.bounds.size.width/5;
    
    __block NSInteger index = 0;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        if ([obj isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            CGRect fram = obj.frame;
            
            if (index == 2) {
                index += 1;
            }
            
            fram.origin.x = itemWidth*index;
            
            index++;
            
            obj.frame = fram;
        }
    }];
}
- (void)gotoVC {
    
    self.black();
}

@end
