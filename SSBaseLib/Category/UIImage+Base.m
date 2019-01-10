//
//  UIImage+Base.m
//  SSBaseLib
//
//  Created by SunSet on 2019/1/10.
//  Copyright © 2019 SunSet. All rights reserved.
//

#import "UIImage+Base.h"

@implementation UIImage (Base)


+ (UIImage *)imageWithColor:(UIColor *)color
{
    UIGraphicsBeginImageContext(CGSizeMake(1, 1));
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ref, color.CGColor);
    CGContextFillRect(ref, CGRectMake(0, 0, 1, 1));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


// 根据颜色生成改变图片
- (UIImage *)imageTintedWithColor:(UIColor *)color{
    if (color) {
        // Construct new image the same size as this one.
        UIImage *image;
        
        if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
            UIGraphicsBeginImageContextWithOptions([self size], NO, 0.f); // 0.f for scale means "scale for device's main screen".
        } else {
            UIGraphicsBeginImageContext([self size]);
        }
        
        CGRect rect = CGRectZero;
        rect.size = [self size];
        
        // Composite tint color at its own opacity.
        [color set];
        UIRectFill(rect);
        
        // Mask tint color-swatch to this image's opaque mask.
        // We want behaviour like NSCompositeDestinationIn on Mac OS X.
        [self drawInRect:rect blendMode:kCGBlendModeDestinationIn alpha:1.0];
        
        // Finally, composite this image over the tinted mask at desired opacity.
        //        if (fraction > 0.0) {
        //            // We want behaviour like NSCompositeSourceOver on Mac OS X.
        //            [self drawInRect:rect blendMode:kCGBlendModeSourceAtop alpha:fraction];
        //        }
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image;
    }
    return self;
}


//生成二维码
+ (UIImage *)imageQrcodeViewWithStr:(NSString *)qrcodestr
{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    //KVC
    NSData * data = [qrcodestr dataUsingEncoding:4];
    [filter setValue:data forKey:@"inputMessage"];
    
    CIImage *outputimage = [filter outputImage];
    UIImage * image = [[UIImage alloc]initWithCIImage:outputimage];
    UIImage *resized = [self resizeImage:image
                             withQuality:kCGInterpolationNone
                                    rate:5.0];
    return resized;
}

//生成图片
+ (UIImage *)resizeImage:(UIImage *)image
             withQuality:(CGInterpolationQuality)quality
                    rate:(CGFloat)rate
{
    UIImage *resized = nil;
    CGFloat width = image.size.width * rate;
    CGFloat height = image.size.height * rate;
    
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, quality);
    [image drawInRect:CGRectMake(0, 0, width, height)];
    resized = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resized;
}




@end





