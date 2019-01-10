//
//  NSString+Coder_Decoder.h
//  SSBaseLib
//
//  Created by SunSet on 2017/12/5.
//  Copyright © 2017年 SunSet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URLEncode)


/**
 url编码

 @return 编码过的字符串
 */
- (NSString*)urlEncode;

/**
 url解码

 @return 解码完成的字符串
 */
- (NSString *)urlDecode;


/**
 MD5加密

 @return 加密后的字符串
 */
- (NSString *)md5;


@end
