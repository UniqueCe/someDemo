//
//  UIViewController+Swizzle.m
//  asda
//
//  Created by lzhl_iOS on 2018/10/30.
//  Copyright © 2018年 lzhl_iOS. All rights reserved.
//

#import "UIViewController+Swizzle.h"
#import <objc/runtime.h>


@implementation UIViewController (Swizzle)

+ (void)load {
    
//    static dispatch_once_t onceToken;
//    
//    dispatch_once(&onceToken, ^{
//       
//        Class class = [self class];
//        
//        SEL originalSelector = @selector(viewDidLoad);
//        SEL swizzleSelector = @selector(LPC_viewDidLoad);
//        
//        Method originalMetod = class_getInstanceMethod(class, originalSelector);
//        Method swizzleMethod = class_getInstanceMethod(class, swizzleSelector);
//        
//        BOOL didLoadMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
//        
//        if (didLoadMethod) {
//            
//            class_replaceMethod(class, swizzleSelector, method_getImplementation(originalMetod), method_getTypeEncoding(originalMetod));
//        }else {
//            method_exchangeImplementations(originalMetod, swizzleMethod);
//        }
//    });
//    
//    NSLog(@"load");
}

- (void)LPC_viewDidLoad {
    [self LPC_viewDidLoad];
    
    NSLog(@"LPC_viewDidLoad == %@ - ",self);
    
   
}

@end
