//
//  NSString+Price.h
//  SSBaseLib
//  字符串相应的价格处理
//  Created by SunSet on 2019/1/10.
//  Copyright © 2019 SunSet. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Price)


/**
 去除价格中多余的小数点

 @return 价格
 */
- (NSString *)p_delUnnecessaryZero;


@end

NS_ASSUME_NONNULL_END
