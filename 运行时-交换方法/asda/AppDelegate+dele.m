//
//  AppDelegate+dele.m
//  asda
//
//  Created by iOS-UI on 2018/12/17.
//  Copyright © 2018 lzhl_iOS. All rights reserved.
//

#import "AppDelegate+dele.h"
#import <objc/runtime.h>

const char* kGuaidWindowKey = "kGuaidWindowKey";

@interface AppDelegate ()

@property(nonatomic, strong) UIView *guidView;

@end

@implementation AppDelegate (dele)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class clas = [self class];
        
        SEL original = @selector(application:didFinishLaunchingWithOptions:);
        SEL swizzle = @selector(iOS_application:didFinishLaunchingWithOptions:);
        
        Method mr = class_getInstanceMethod(clas, original);
        Method sw = class_getInstanceMethod(clas, swizzle);
        
        BOOL didLoadMethod = class_addMethod(clas, original, method_getImplementation(sw), method_getTypeEncoding(sw));
        
        if (didLoadMethod) {
            class_replaceMethod(clas, swizzle, method_getImplementation(mr), method_getTypeEncoding(mr));
        }else {
            method_exchangeImplementations(mr, sw);
        }
        
    });
}

- (BOOL)iOS_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.guidView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.guidView.backgroundColor = [UIColor redColor];
    [self.window.rootViewController.view addSubview:self.guidView];
    
    self.guidView.userInteractionEnabled = true;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(aClickAction)];
    [self.guidView addGestureRecognizer:tap];
    
    NSLog(@"++++");
    
    return YES;
}

- (void)aClickAction {
    
    [self.guidView removeFromSuperview];
    NSLog(@"remove");
}

- (UIView *)guidView {
    return objc_getAssociatedObject(self, kGuaidWindowKey);
}

- (void)setGuidView:(UIView *)guidView {
    objc_setAssociatedObject(self, kGuaidWindowKey, guidView, OBJC_ASSOCIATION_RETAIN);
}

@end
