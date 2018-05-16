//
//  AFNDownHAHA.m
//  AFN判断NetWotk
//
//  Created by lzhl_iOS on 2017/3/22.
//  Copyright © 2017年 lzhl_iOS. All rights reserved.
//

#import "AFNDownHAHA.h"
#import "AFHTTPSessionManager.h"

@interface AFNDownHAHA ()

@property(nonatomic, weak) IBOutlet UILabel  *labelNum;

@property (weak, nonatomic) IBOutlet UISlider *jindutiaoSlider;

@end

@implementation AFNDownHAHA

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self downLoadMonitor];
    
}


#pragma --> 执行下载文件的方法,可以监控下载进度
- (void)downLoadMonitor {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://120.25.226.186:32812/resources/videos/minion_02.mp4"]];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        CGFloat jindu = 1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount;
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            self.labelNum.text = [NSString stringWithFormat:@"%0.1f%%",jindu*100];
            self.jindutiaoSlider.value = jindu;
        });
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        //MARK:返回路径
        NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        NSString *path = [cachesPath stringByAppendingPathComponent:response.suggestedFilename];
        
        return [NSURL fileURLWithPath:path];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        NSLog(@"error%@=",error);
        
        //设置下载完成操作
        NSLog(@"哈哈filePath%@",filePath);
        [self PromptWindow];
        
    }];
    
    //MARK:必须要启动任务
    [downloadTask resume];
    
}

- (void)PromptWindow {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"⭐️ 下载 完成 ⭐️" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.jindutiaoSlider.value = 0;
            self.labelNum.text = @"";
        });
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:action];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
