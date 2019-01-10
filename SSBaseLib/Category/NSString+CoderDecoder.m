//
//  NSString+Coder_Decoder.m
//  SSBaseLib
//
//  Created by SunSet on 2017/12/5.
//  Copyright © 2017年 SunSet. All rights reserved.
//

#import "NSString+CoderDecoder.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (CoderDecoder)

- (NSString*)urlEncode
{
    // 一期方式
//    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(                                     NULL,                                     (CFStringRef)self,                                     NULL,                                    (CFStringRef)"!*'();:@&=+$,/?%#[]",                                  kCFStringEncodingUTF8 ));
//    return encodedString;
    
    // 二期方式
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}


- (NSString *)urlDecode
{
    // 一期方式
//    NSString *decodedString = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)self, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
//    return decodedString;
    
    // 二期方式
    return [self stringByRemovingPercentEncoding];
}


// MD5加密后的字符串
- (NSString *)md5 {
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}




@end
