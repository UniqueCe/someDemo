//
//  UIImage+Extensin.m
//  异步裁剪圆形图片
//
//  Created by 刘培策 on 16/11/1.
//  Copyright © 2016年 UniqueCe. All rights reserved.
//

#import "UIImage+Extensin.h"

@implementation UIImage (Extensin)

- (void)imageWithOvalPictureSize:(CGSize)imageSize fillColor:(UIColor *)color  black:(void(^)(UIImage *))blackImage {
    
   dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
       UIGraphicsBeginImageContextWithOptions(imageSize, YES, 0);
       
       CGRect rect = CGRectMake(0, 0, imageSize.width, imageSize.height);
       
       [color setFill];
       UIRectFill(rect);
       
       UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
       
       [path addClip];
       
       [self drawInRect:rect];
       
       UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
       
       UIGraphicsEndImageContext();
       
       dispatch_async(dispatch_get_main_queue(), ^{
           
           if (blackImage != nil) {
               
               blackImage(image);
           }
       });
       
   });

}

- (void)imageWithRoundedSize:(CGSize)imageSize fillColor:(UIColor *)color black:(void(^)(UIImage *imageBlack))blackImage {
    
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        
        UIGraphicsBeginImageContextWithOptions(imageSize, YES, 0);
        
        CGRect rect = CGRectMake(0, 0, imageSize.width, imageSize.height);
        
        [color setFill];
        UIRectFill(rect);
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:20];
        
        [path addClip];
        
        [self drawInRect:rect];
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (blackImage != nil) {
                
                blackImage(image);
            }
        });
    
        UIGraphicsEndImageContext();
    });
}


@end
