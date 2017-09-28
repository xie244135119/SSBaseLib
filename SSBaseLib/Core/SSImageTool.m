//
//  SSImageTool.m
//  SSBaseLib
//
//  Created by SunSet on 2017/9/28.
//  Copyright © 2017年 SunSet. All rights reserved.
//

#import "SSImageTool.h"

@implementation SSImageTool

// 区域裁剪
+ (UIImage *)clipWithSize:(CGSize)clipSize
                 clipType:(NSInteger)clitype
                    image:(UIImage *)originImage
{
    // 原图大小小于需要裁剪的区域
    CGSize originsize = originImage.size;
    if (originsize.width <= clipSize.width && originsize.height <= clipSize.height) {
        return originImage;
    }
    
    CGRect cliprect = CGRectZero;
    switch (clitype) {
        case 1:         //居中裁剪
        {
            // 计算宽和高
            CGFloat x,y;
            if (originsize.width >= clipSize.width) {
                x = (originsize.width-clipSize.width)/2;
            }
            else {
                x = 0;
            }
         
            if (originsize.height >= clipSize.height) {
                y = (originsize.height-clipSize.height)/2;
            }
            else {
                y = 0;
            }
            
            cliprect = CGRectMake(x, y, clipSize.width, clipSize.height);
        }
            break;
            
        default:
            break;
    }
    
    CGFloat scale =  [[UIScreen mainScreen] scale];
    CGRect cliprectref = CGRectMake(cliprect.origin.x*scale, cliprect.origin.y*scale, cliprect.size.width*scale, cliprect.size.height*scale);
    //将UIImage转换成CGImageRef
    CGImageRef sourceImageRef = [originImage CGImage];
    //按照给定的矩形区域进行剪裁
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, cliprectref);
    //将CGImageRef转换成UIImage
    UIImage *newImage = [[UIImage alloc]initWithCGImage:newImageRef];
    return newImage;
}



@end




