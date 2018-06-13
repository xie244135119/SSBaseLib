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
+ (UIImage *)clipWithSize:(CGSize)aClipSize
                 clipType:(NSInteger)clitype
                    image:(UIImage *)aOriginImage
{
    // 换算成CGImageRef中的大小
    CGFloat scale =  [[UIScreen mainScreen] scale];
    CGSize  clipImageSize = CGSizeMake(aClipSize.width*scale, aClipSize.height*scale);
    
    //将UIImage转换成CGImageRef
    CGImageRef sourceImageRef = [aOriginImage CGImage];
    // 原图大小小于需要裁剪的区域
    CGSize originsize = CGSizeMake(CGImageGetWidth(sourceImageRef), CGImageGetHeight(sourceImageRef));
    if (originsize.width <= clipImageSize.width && originsize.height <= clipImageSize.height) {
        return aOriginImage;
    }
    
    CGRect cliprect = CGRectZero;
    switch (clitype) {
        case 1:         //居中裁剪
        {
            // 计算宽和高
            CGFloat x,y;
            if (originsize.width >= clipImageSize.width) {
                x = (originsize.width-clipImageSize.width)/2;
            }
            else {
                x = 0;
            }
         
            if (originsize.height >= clipImageSize.height) {
                y = (originsize.height-clipImageSize.height)/2;
            }
            else {
                y = 0;
            }
            
            cliprect = CGRectMake(x, y, clipImageSize.width, clipImageSize.height);
        }
            break;
            
        default:
            break;
    }
    
    //按照给定的矩形区域进行剪裁
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, cliprect);
    //将CGImageRef转换成UIImage
    UIImage *newImage = [[UIImage alloc]initWithCGImage:newImageRef];
    CGImageRelease(newImageRef);
    return newImage;
}


+ (UIImage *)scaleWithMaxWidth:(CGFloat)maxWidth
                         image:(UIImage *)originImage
{
    if (maxWidth == 0 || originImage == nil) {
        return nil;
    }
    
    CGFloat maxheight = originImage.size.height*maxWidth/originImage.size.width;
    CGSize size = CGSizeMake(maxWidth, maxheight);
    return [self scaleWithSize:size image:originImage];
}

+ (UIImage *)scaleWithMaxHeight:(CGFloat)maxHeight
                          image:(UIImage *)originImage
{
    if (maxHeight == 0 || originImage == nil) {
        return nil;
    }
    
    CGFloat maxWidth = originImage.size.width*maxHeight/originImage.size.height;
    return [self scaleWithSize:CGSizeMake(maxWidth, maxHeight) image:originImage];
}

+ (UIImage *)scaleWithSize:(CGSize)size
                     image:(UIImage *)originImage
{
    UIGraphicsBeginImageContext(size);
    [originImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}




@end




