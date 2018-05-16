//
//  ViewController.m
//  AFN判断NetWotk
//
//  Created by lzhl_iOS on 2017/3/3.
//  Copyright © 2017年 lzhl_iOS. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
//有无网络
- (IBAction)check:(id)sender {

    [self checkNetWorkAvailableSuccess:^{
        
        [self alertWithMessage:@"有网络"];
    } AndFailed:^{
        
        [self alertWithMessage:@"😂无网络😂"];
    }];
}

//网络类型
- (IBAction)checkNetWork:(id)sender {

    [self checkNetWorkAvailable];
}

- (void)checkNetWorkAvailable {
    
    NSURL *baseURL = [NSURL URLWithString:@"http://www.baidu.com"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
                [self alertWithMessage:@"2G网络、3G网络、4G连接"];
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [self alertWithMessage:@"WIFI连接"];
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                [self alertWithMessage:@"无连接"];
                break;
                
            case AFNetworkReachabilityStatusUnknown:
                [self alertWithMessage:@"连接状态未知"];
                break;
        }
    }];
    
    [manager.reachabilityManager startMonitoring];
}


- (void)checkNetWorkAvailableSuccess:(void(^)())successBlock  AndFailed:(void(^)())failBlock {
    
    NSURL *baseURL = [NSURL URLWithString:@"http://www.baidu.com"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
            case AFNetworkReachabilityStatusUnknown:
                
                successBlock();
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                
                failBlock();
                break;
        }
    }];
    
    [manager.reachabilityManager startMonitoring];
}


- (void)alertWithMessage:(NSString *)mas {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:mas preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self dismissViewControllerAnimated:YES completion:nil];
    });
}























@end
