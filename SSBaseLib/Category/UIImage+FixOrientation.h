//
//  UIImage+FixOrientation.h
//  EastAxe
//
//  Created by SunSet on 14-3-11.
//  Copyright (c) 2014年 SunSet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FixOrientation)

/*修正相机拍摄出来的照片角度问题*/
- (UIImage *)fixOrientation;
//- (UIImage* )rotateImage;

//重画压缩
- (UIImage *)zipWithDraw;

@end
