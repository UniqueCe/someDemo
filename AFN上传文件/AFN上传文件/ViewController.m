//
//  ViewController.m
//  AFN上传文件
//
//  Created by lzhl_iOS on 2017/3/22.
//  Copyright © 2017年 lzhl_iOS_LPC. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray <UIImage *>*array = [[NSMutableArray alloc] init];

    UIImageView *image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"猴怪"]];
    image1.frame = CGRectMake(30, 30, 50, 50);
    [self.view addSubview:image1];
    UIImageView *image2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"喵猫"]];
    image2.frame = CGRectMake(100, 30, 50, 50);
    [self.view addSubview:image2];
    UIImageView *image3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"照相机"]];
    image3.frame = CGRectMake(170, 30, 50, 50);
    [self.view addSubview:image3];

    
    UIImage *ima1 = [UIImage imageNamed:@"猴怪"];
    UIImage *ima2 = [UIImage imageNamed:@"喵猫"];
    UIImage *ima3 = [UIImage imageNamed:@"照相机"];
    [array addObject:ima1];
    [array addObject:ima2];
    [array addObject:ima3];
    
    NSDictionary *dict = @{ @"username":@"Syl" };
    
    [self upLoad:@"http://120.25.226.186:32812/upload" parameters:dict imageArray:array andCallBlock:^(id response, NSError *error) {
        
        if (error) {
            
            NSLog(@"网络请求异常: %@", error);
            return;
        }
        
        NSLog(@"%@", response);
    }];
}

#pragma mark - 网络请求，上传图片
- (void)upLoad:(NSString *)url parameters:(NSDictionary *)parameter imageArray:(NSArray *)uploadImages andCallBlock: (void (^) (id response, NSError *error))callBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:url parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (int i=0; i<uploadImages.count; i++) {
            
            UIImage *uploadImage = uploadImages[i];
            NSData *data = UIImageJPEGRepresentation(uploadImage, 0.5f);
            
            NSString *curWholeFileName = [NSString stringWithFormat: @"file%d.png", i];

           [formData appendPartWithFileData:data name:@"file" fileName:curWholeFileName mimeType:@"image/png"];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
        callBlock(responseObject ,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        callBlock(nil , error);
    }];
}

@end
