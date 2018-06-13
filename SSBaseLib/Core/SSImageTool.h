//
//  SSImageTool.h
//  SSBaseLib
//  图片处理类
//  Created by SunSet on 2017/9/28.
//  Copyright © 2017年 SunSet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SSImageTool : NSObject


/**
 图片裁剪

 @param clipSize 裁剪大小
 @param clitype 裁剪类型 目前支持：1 居中裁剪
 @param clipImage 裁剪图片
 @return 图片
 */
+ (UIImage *)clipWithSize:(CGSize)clipSize
                 clipType:(NSInteger)clitype
                    image:(UIImage *)clipImage;

/**
 按照最大宽度等比例剪裁

 @param maxWidth 最大宽度
 @param originImage 原始图片
 @return 处理过的图片
 */
+ (UIImage *)scaleWithMaxWidth:(CGFloat)maxWidth
                     image:(UIImage *)originImage;

/**
 按照最大高度等比例剪裁

 @param maxHeight 最大高度
 @param originImage 原始图片
 @return 处理好的图片
 */
+ (UIImage *)scaleWithMaxHeight:(CGFloat)maxHeight
                        image:(UIImage *)originImage;

/**
 按照给定的比例处理图片

 @param size 给定的比例
 @param originImage 原始图片
 @return 处理好的图片
 */
+ (UIImage *)scaleWithSize:(CGSize)size
                     image:(UIImage *)originImage;



@end







