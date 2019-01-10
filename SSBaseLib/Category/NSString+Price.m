//
//  NSString+Price.m
//  SSBaseLib
//
//  Created by SunSet on 2019/1/10.
//  Copyright © 2019 SunSet. All rights reserved.
//

#import "NSString+Price.h"
#import <UIKit/UIKit.h>

@implementation NSString (Price)

// 去除价格中多余的0 例如 12.00
- (NSString *)p_delUnnecessaryZero
{
    // 处理两位
    NSInteger intPrice = self.integerValue;
    // 没有小数点
    if (self.floatValue-intPrice == 0) {
        return [[NSString alloc]initWithFormat:@"%.0f",self.doubleValue];
    }
    // 1位小数点
    NSString *tempstr = [[NSString alloc]initWithFormat:@"%.1f",self.doubleValue];
    if (self.floatValue - tempstr.floatValue == 0) {
        return tempstr;
    }
    // 2位小数点
    return self;
}




@end
