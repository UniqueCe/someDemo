//
//  ButtonView.m
//  btnCellDemo
//
//  Created by lzhl_iOS on 2017/12/28.
//  Copyright © 2017年 lzhl_iOS. All rights reserved.
//

#import "ButtonView.h"


#define LabelHeight 30
#define LabelSpac 10  // label之间的间距
#define ViewSpac 15   // label距离屏幕左右的间距

#define LabelWidth ([UIScreen mainScreen].bounds.size.width - 15*2 - 10*3)/4

@implementation ButtonView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if ([super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.backgroundColor = [UIColor yellowColor];
}

- (void)setBtnStr:(NSString *)btnStr {
    
    _btnStr = btnStr;
    
    NSArray *temp = [btnStr componentsSeparatedByString:@","];
    
    int row = 0;
    int col = -1;
    
    for (int i = 0; i < temp.count; i++) {
        
        UILabel *btnLa = [UILabel new];
        btnLa.text = temp[i];
        btnLa.layer.borderColor = [UIColor orangeColor].CGColor;
        btnLa.layer.borderWidth = 1.0f;
        btnLa.layer.cornerRadius = LabelHeight/2;
        btnLa.layer.masksToBounds = YES;
        btnLa.textAlignment = NSTextAlignmentCenter;
        btnLa.font = [UIFont systemFontOfSize:15];

        // 第二种方法 使用多行
        if (i % 4 == 0 && i != 0) {
            row += 1;
            col = i%4 - 1;
        }
        col += 1;
        
        btnLa.frame = CGRectMake(ViewSpac+LabelWidth*col+LabelSpac*col, 10*(row+1)+LabelHeight*row, LabelWidth, LabelHeight);
        
        [self addSubview:btnLa];
    }
}


@end
