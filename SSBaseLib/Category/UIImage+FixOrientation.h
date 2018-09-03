//
//  UIImage+FixOrientation.h
//  EastAxe
//
//  Created by SunSet on 14-3-11.
//  Copyright (c) 2014年 SunSet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FixOrientation)


/**
 修正相机拍摄出来的照片角度问题

 @return image
 */
- (UIImage *)fixOrientation;

/**
 重画压缩
 原始方法 逐渐废弃
 @return image
 */
- (UIImage *)zipWithDraw;

/**
 微信特定的压缩方式

 @return image
 */
- (UIImage *)zipWithWechat;

/**
 最大压缩比例

 @param maxLength 最大大小 为0 表示默认500kb
 @return 一张处理过的图片
 */
- (UIImage *)zipWithMaxLength:(NSUInteger)maxLength;



@end
