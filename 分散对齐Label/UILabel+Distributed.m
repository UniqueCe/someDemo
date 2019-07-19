//
//  UILabel+Distributed.m
//  AttendanceAssistant
//
//  Created by Sure on 2017/8/15.
//  Copyright © 2017年 Hsiao. All rights reserved.
//

#import "UILabel+Distributed.h"
#import <CoreText/CoreText.h>

@implementation UILabel (Distributed)

/**
 设置分散对齐
 
 @param labelWidth Label宽度
 */
- (void)setAligmentDistributedWithWidth:(CGFloat)labelWidth
{
    CGSize testSize = [self.text boundingRectWithSize:CGSizeMake(labelWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine| NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName :self.font} context:nil].size;
    //计算间距
    CGFloat margin = (labelWidth - testSize.width)/(self.text.length - 1);
    NSNumber *number = [NSNumber numberWithFloat:margin];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:self.text];
    
    [attribute addAttribute: NSKernAttributeName value:number range:NSMakeRange(0, self.text.length - 1 )];
    self.attributedText = attribute;
}

@end
