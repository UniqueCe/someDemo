//
//  TLTableCellDeleteView.h
//  PiyingkeLibrary
//
//  Created by Tianlong on 2017/5/17.
//
//

#import <UIKit/UIKit.h>

@interface TLTableCellDeleteView : UIView

@property (nonatomic , weak) UIButton *firstB;
@property (nonatomic , weak) UIButton *secondB;

@property (nonatomic , copy) void (^firstBLock)();
@property (nonatomic , copy) void (^secondBLock)();

@end
