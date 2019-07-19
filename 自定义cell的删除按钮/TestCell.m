//
//  TestCell.m
//  CustomCellDeleteView
//
//  Created by Tianlong on 2017/9/26.
//  Copyright © 2017年 Tianlong. All rights reserved.
//

#import "TestCell.h"

#define PYKRandomColor [UIColor colorWithRed:(arc4random_uniform(256) / 255.0) green:(arc4random_uniform(256) / 255.0) blue:(arc4random_uniform(256) / 255.0) alpha:1.0]

@interface TestCell ()

@end

@implementation TestCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        TLTableCellDeleteView *deleteV = [[TLTableCellDeleteView alloc] init];
        self.deleteV = deleteV;
        [self.contentView addSubview:self.deleteV];
    }
    self.backgroundColor = PYKRandomColor;
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.deleteV.frame = CGRectMake(self.contentView.bounds.size.width, 0, 210, self.contentView.bounds.size.height);
}

@end
