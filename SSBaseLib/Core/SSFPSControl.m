//
//  SSFPSControl.m
//  SSBaseLib
//
//  Created by SunSet on 2017/12/18.
//  Copyright © 2017年 SunSet. All rights reserved.
//

#import "SSFPSControl.h"

@interface SSFPSControl()
{
//    NSTimer *_timer;
    CADisplayLink *_displayLink;            //fps监控
    
    NSTimeInterval _lastTimeStamp;          //上次时间戳
    
    NSInteger _currentInvokeCount;                //执行次数
}
@end

@implementation SSFPSControl

- (void)dealloc
{
    _displayLink = nil;
}


- (id)init
{
    if (self = [super init]) {
        //
        [self _addTimer];
    }
    return self;
}


#pragma mark - public api
//
- (void)invalidate
{
    [_displayLink invalidate];
}




#pragma mark - private api
//
- (void)_addTimer
{
//    NSTimer *;
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLink:)];
    [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

// 每帧执行的时间
- (void)displayLink:(CADisplayLink *)link
{
    NSLog(@" timestamp:%f, duration:%f ",link.timestamp, link.duration);
    if (_lastTimeStamp == 0) {
        _lastTimeStamp = link.timestamp;
        return;
    }
    _currentInvokeCount++;
    
    NSInteger delta = link.timestamp-_lastTimeStamp;
    if (delta >= 1) {
        float fps = (float)_currentInvokeCount/delta;
        
        if ([_delegate respondsToSelector:@selector(control:fps:)]) {
            [_delegate control:self fps:roundf(fps)];
        }
        
        // 清空数值
        _currentInvokeCount = 0;
        _lastTimeStamp = 0;
    }
}






@end







