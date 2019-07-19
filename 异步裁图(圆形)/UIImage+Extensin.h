//
//  UIImage+Extensin.h
//  异步裁剪圆形图片
//
//  Created by 刘培策 on 16/11/1.
//  Copyright © 2016年 UniqueCe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extensin)

/**
 绘制圆形图片
 
 @param imageSize imageView的size
 @param color 填充颜色
 @param blackImage 回调Image
 */
- (void)imageWithOvalPictureSize:(CGSize)imageSize fillColor:(UIColor *)color black:(void(^)(UIImage *imageBlack))blackImage;

/**
 添加倒角

 @param imageSize imageView的size
 @param color 填充颜色
 @param blackImage 回调Image
 */
- (void)imageWithRoundedSize:(CGSize)imageSize fillColor:(UIColor *)color black:(void(^)(UIImage *imageBlack))blackImage;

@end
