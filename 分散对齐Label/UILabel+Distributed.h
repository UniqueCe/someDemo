//
//  UILabel+Distributed.h
//  AttendanceAssistant
//
//  Created by Sure on 2017/8/15.
//  Copyright © 2017年 Hsiao. All rights reserved.
//  分散对齐的Label  -- 仅支持单行

#import <UIKit/UIKit.h>

@interface UILabel (Distributed)


/**
 设置分散对齐

 @param labelWidth Label宽度
 */
- (void)setAligmentDistributedWithWidth:(CGFloat)labelWidth;

@end
