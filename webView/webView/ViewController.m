//
//  ViewController.m
//  webView
//
//  Created by lzhl_iOS on 2017/3/30.
//  Copyright © 2017年 lzhl_iOS_LPC. All rights reserved.
//

#import "ViewController.h"

#import <JavaScriptCore/JavaScriptCore.h>
#import "twoController.h"

@interface ViewController ()<UIWebViewDelegate>

@property(nonatomic, strong)UIWebView *web;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    _web = webView;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    webView.scrollView.bounces = NO;
    webView.delegate = self;
    [self.view addSubview:webView];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
  
    NSString * str = request.URL.relativeString;

    if ([str isEqualToString:@"http://www.baidu.com/"]) {
        NSLog(@"来找度娘");
    }
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"1");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSString * str = [_web stringByEvaluatingJavaScriptFromString:@"document.getElementById(""\"index-kw""\").value=""\"li""\""];
    
    NSLog(@"webViewDidFinishLoad=%@",str);
    
    twoController *two = [[twoController alloc] init];
    [self.navigationController pushViewController:two animated:YES];

}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"3");
    
   
}
@end
