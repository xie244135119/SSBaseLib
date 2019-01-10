//
//  UIImage+Base.h
//  SSBaseLib
//
//  Created by SunSet on 2019/1/10.
//  Copyright © 2019 SunSet. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Base)


/**
 *  根绝颜色或图片名称生成图片
 *  @param color 颜色或图片名称
 */
+ (UIImage *)imageWithColor:(UIColor *)color;


/**
 根据颜色改变图片样式
 
 @param color 需要渲染的颜色
 @return image
 */
- (UIImage *)imageTintedWithColor:(UIColor *)color;


/**
 *  二维码生成功能
 *  @param qrcodestr 文本串
 *  @return 图片
 */
+ (UIImage *)imageQrcodeViewWithStr:(NSString *)qrcodestr;



@end

NS_ASSUME_NONNULL_END
