//
//  UIColor+Base.h
//  SSBaseLib
//
//  Created by SunSet on 2019/1/10.
//  Copyright © 2019 SunSet. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Base)


/**
 * 颜色转换 IOS中十六进制的颜色转换为UIColor
 * FF9500,FF5236
 */
+ (UIColor *)colorWithHexString:(NSString *)color;


@end

NS_ASSUME_NONNULL_END
