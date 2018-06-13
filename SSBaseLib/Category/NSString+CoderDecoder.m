//
//  NSString+Coder_Decoder.m
//  SSBaseLib
//
//  Created by SunSet on 2017/12/5.
//  Copyright © 2017年 SunSet. All rights reserved.
//

#import "NSString+CoderDecoder.h"

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





@end
