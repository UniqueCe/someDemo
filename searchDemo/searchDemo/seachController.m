//
//  seachController.m
//  NewGoldUnion
//
//  Created by lzhl_iOS on 2017/5/11.
//  Copyright © 2017年 lzhl_iOS_LPC. All rights reserved.
//

#import "seachController.h"
#import "historyView.h"

//MARK:16进制颜色
#define ColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s &0xFF00) >>8))/255.0 blue:((s &0xFF))/255.0 alpha:1.0]

@interface seachController ()

//搜索历史
@property(nonatomic, strong) UIView *historySearchView;

//搜索框
@property(nonatomic, strong) UITextField *searchTextField;

@property(nonatomic, strong) historyView *history;



@end

@implementation seachController {
    
    NSMutableArray *_searchOneDataArray; //键入前
    NSMutableArray *_searchFuzzyDataArray; //键入时 模糊搜索
    NSMutableArray *_tmpMArray;
    NSString *_selectedSeachBtnStr; //搜索的商品名称
    NSString *_textPlaceholderStr; //textField的默认值
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setupNavigationItemTitleView];
    if (_selectedSeachBtnStr != nil && _selectedSeachBtnStr.length >0) {
        self.searchTextField.text = _selectedSeachBtnStr;
        self.searchTextField.placeholder = _textPlaceholderStr;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupBackUI];
}

- (void)setupBackUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpTableView];
}

- (void)setupNavigationItemTitleView {
    
    UITextField *seachText = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 100, 30)];
    seachText.font = [UIFont systemFontOfSize:14];
    seachText.backgroundColor = [UIColor whiteColor];
    seachText.borderStyle = UITextBorderStyleRoundedRect;
    [seachText addTarget:self action:@selector(textFieldChangeAction) forControlEvents:UIControlEventEditingChanged];
    self.searchTextField = seachText;
  
    self.navigationItem.titleView = seachText;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem setBarButtonTitle:@"搜索" SelectedTitle:nil andTarget:self andAction:@selector(rightBarSeachClickAction)];
}

- (void)setUpTableView {
    
    _history = [[historyView alloc] init];
    NSArray *temp = @[@"能送到否结束",@"苏菲的世界的",@"煽风点火为",@"闪电借款发挥空间很深刻的反馈",@"sdfsld",@"SDK粉红色",@"水电费加塞的"];
    _history.historyMarray = temp.copy;
    __weak __typeof(self) weakSelf = self;
    _history.seachTextFieldBlock = ^(NSString *textString){

        _selectedSeachBtnStr = textString;
        weakSelf.searchTextField.text = textString;
        [weakSelf.navigationItem.titleView endEditing:YES];
    };

    [self.view addSubview:_history];
    self.historySearchView = _history;
    [_history mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(64);
        make.bottom.equalTo(self.view.mas_bottom).offset(-49);
    }];
}

- (void)rightBarSeachClickAction {
    
    [self.navigationItem.titleView endEditing:YES];
    self.searchTextField.text = self.searchTextField.placeholder;
}

- (void)XClickAction:(UIButton *)sender {

    sender.selected = YES;
    
    [_history addToHistory:self.searchTextField.text];
    
    self.searchTextField.text = nil;
}

- (void)textFieldChangeAction {
    
    NSLog(@"textFieldChangeAction");
}


@end
