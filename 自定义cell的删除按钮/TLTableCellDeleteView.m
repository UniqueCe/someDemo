//
//  TLTableCellDeleteView.m
//  PiyingkeLibrary
//
//  Created by Tianlong on 2017/5/17.
//
//

#import "TLTableCellDeleteView.h"
#import "UIColor+HexStr.h"
#import "Masonry.h"

@interface TLTableCellDeleteView ()

@end

@implementation TLTableCellDeleteView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIButton *firstB = [[UIButton alloc] init];
        self.firstB = firstB;
        self.firstB.backgroundColor = [UIColor colorWithHexString:@"FFC500"];
        [self.firstB setTitleColor:[UIColor colorWithHexString:@"FFFFFF"] forState:UIControlStateNormal];
        [self.firstB setTitle:@"换成imageView" forState:UIControlStateNormal];
        
        [self addSubview:self.firstB];
        [self.firstB addTarget:self action:@selector(clickedFirstB:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *secondB = [[UIButton alloc] init];
        self.secondB = secondB;
        self.secondB.backgroundColor = [UIColor colorWithHexString:@"FF0000"];
        [self.secondB setTitleColor:[UIColor colorWithHexString:@"FFFFFF"] forState:UIControlStateNormal];
        [self.secondB setTitle:@"删除" forState:UIControlStateNormal];
        
        [self addSubview:self.secondB];
        [self.secondB addTarget:self action:@selector(clickedSecondB:) forControlEvents:UIControlEventTouchUpInside];
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.firstB.frame = CGRectMake(0, 0, 270*0.5, self.bounds.size.height);
    self.secondB.frame = CGRectMake(CGRectGetMaxX(self.firstB.frame), 0, 160*0.5, self.bounds.size.height);
}

/** 此项目没用到这个方法 */
-(void)clickedFirstB:(UIButton *)btn{
    if (self.firstBLock) {
        self.firstBLock();
    }
}

/** 此项目没用到这个方法 */
-(void)clickedSecondB:(UIButton *)btn{
    if (self.secondBLock) {
        self.secondBLock();
    }
}

@end
