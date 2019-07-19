//
//  UIImage+Extension.h
//  asynchronousClippingDemo
//
//  Created by 刘培策 on 16/11/1.
//  Copyright © 2016年 UniqueCe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 绘制圆形图片

 @param ImageSize imageView的size
 @param fillColor 填充颜色
 @param callback 回调Image
 */
- (void)imageWithSize:(CGSize)ImageSize fillColor:(UIColor *)fillColor Callback:(void(^)(UIImage *image))callback;

/**
 绘制圆角

 @param ImageSizeRound imageView的size
 @param fillColorRound 填充颜色
 @param callbackImage 回调Image
 */
- (void)imageWithRoundedPictureSize:(CGSize)ImageSizeRound fillColor:(UIColor *)fillColorRound Callback:(void (^)(UIImage *image))callbackImage;


@end
