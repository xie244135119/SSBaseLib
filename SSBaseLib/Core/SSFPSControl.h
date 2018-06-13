//
//  SSFPSControl.h
//  SSBaseLib
//  FPS监控数值显示
//  Created by SunSet on 2017/12/18.
//  Copyright © 2017年 SunSet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class SSFPSControl;

@protocol SSFPSControlDelegate<NSObject>

@optional
// 返回实时fps值
- (void)control:(SSFPSControl *)control fps:(NSInteger)fps;

@end


@interface SSFPSControl : NSObject

// fps代理
@property(nonatomic, weak) id<SSFPSControlDelegate> delegate;


//  退出
- (void)invalidate;



@end



