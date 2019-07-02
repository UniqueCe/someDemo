//
//  Header.h
//  asda
//
//  Created by iOS-UI on 2018/12/18.
//  Copyright © 2018 lzhl_iOS. All rights reserved.
//

#ifndef Header_h
#define Header_h

/**
 多种颜色渐变View
 
 @param colors 渐变颜色数组（(__bridge id) 桥接    .CGColor 类型）
 @param locations 数值渐变位置
 @param frame framw
 @param supView 需要渐变的View
 */
void drawGradientLayerColor(NSArray *colors, NSArray<NSNumber *> *locations,CGRect frame, UIView *supView) {
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = colors;
    gradientLayer.locations = locations;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = frame;
    [supView.layer addSublayer:gradientLayer];
}

void dispatchAfter(void(^layout)(void)) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (layout) layout();
    });
}

#endif /* Header_h */
