//
//  UIImage+Color.h
//  AutoStatusDemo
//
//  Created by Maple on 2017/11/7.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)
/**
fun 根据颜色(color)和大小(size)生成纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
@end
