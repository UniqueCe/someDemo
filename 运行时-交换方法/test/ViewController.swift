//
//  ViewController.swift
//  test
//
//  Created by iOS-UI on 2018/12/19.
//  Copyright © 2018 lzhl_iOS. All rights reserved.
//

import UIKit


/// GCD 延时
///
/// - Parameters:
///   - delay: 延时时间
///   - closure: 延时回调
func delayTime(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        btn.addTarget(self , action: #selector(aaaa), for: .touchUpInside)
        btn.isSelected = true
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        btn.setTitle("aa", for: .normal)
        btn.setTitle("bbb", for: .selected)
        btn.setBackgroundImage(createImageWithSize(imageSize: btn.bounds.size, colors: [UIColor.red.cgColor, UIColor.blue.cgColor]), for: .selected)
        btn.setBackgroundImage(createImageWithSize(imageSize: btn.bounds.size, colors: [UIColor.orange.cgColor, UIColor.green.cgColor]), for: .normal)
        view.addSubview(btn)

    }
    
    @objc func aaaa(sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
    }
    
    func createImageWithSize(imageSize: CGSize, colors: [CGColor]) -> UIImage{
        
        UIGraphicsBeginImageContextWithOptions(imageSize, true, 1)
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: [0, 1.0])
        
        let start = CGPoint(x: 0.0, y: imageSize.height/2)
        let end = CGPoint(x:imageSize.width, y: imageSize.height/2)
        
        context?.drawLinearGradient(gradient!, start: start, end: end, options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
        
        let img: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        context?.restoreGState()
        UIGraphicsEndImageContext()
        
        return img!
    }
}





/// 多种颜色渐变View
///
/// - Parameters:
///   - colors: 渐变颜色数组（(__bridge id) 桥接    .CGColor 类型）
///   - locations: 数值渐变位置
///   - frame: frame
///   - supView: 需要渐变的View
func drawGradientLayerColor(colors: Array<Any>, locations: Array<NSNumber>, frame: CGRect, supView: UIView) {
    
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = colors
    gradientLayer.locations = locations
    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0)
    gradientLayer.frame = frame
    supView.layer.addSublayer(gradientLayer)
}



/*
 //生成渐变的背景颜色
 - (UIImage *)createImageWithSize:(CGSize)imageSize gradientColors:(NSArray *)colors percentage:(NSArray *)percents gradientType:(GradientType)gradientType {
 NSMutableArray *ar = [NSMutableArray array];
 for(UIColor *c in colors) {
 [ar addObject:(id)c.CGColor];
 }
 CGFloat locations[5];
 for (int i = 0; i < percents.count; i++) {
 locations[i] = [percents[i] floatValue];
 }
 UIGraphicsBeginImageContextWithOptions(imageSize, YES, 1);
 CGContextRef context = UIGraphicsGetCurrentContext();
 CGContextSaveGState(context);
 CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
 CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, locations);
 CGPoint start;
 CGPoint end;
 switch (gradientType) {
 case GradientFromTopToBottom:
 start = CGPointMake(imageSize.width/2, 0.0);
 end = CGPointMake(imageSize.width/2, imageSize.height);
 break;
 case GradientFromLeftToRight:
 start = CGPointMake(0.0, imageSize.height/2);
 end = CGPointMake(imageSize.width, imageSize.height/2);
 break;
 case GradientFromLeftTopToRightBottom:
 start = CGPointMake(0.0, 0.0);
 end = CGPointMake(imageSize.width, imageSize.height);
 break;
 case GradientFromLeftBottomToRightTop:
 start = CGPointMake(0.0, imageSize.height);
 end = CGPointMake(imageSize.width, 0.0);
 break;
 default:
 break;
 }
 CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
 UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
 CGGradientRelease(gradient);
 CGContextRestoreGState(context);
 CGColorSpaceRelease(colorSpace);
 UIGraphicsEndImageContext();
 return image;
 }
 */
