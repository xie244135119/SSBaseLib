//
//  SSGlobalVar.h
//  SSBaseLib
//
//  Created by SunSet on 2017/7/20.
//  Copyright © 2017年 SunSet. All rights reserved.
//

#ifndef SSGlobalVar_h
#define SSGlobalVar_h

// GCD相关
#define SSGlobalQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define SSMainQueue dispatch_get_main_queue()



// 调试相关
#if DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif



#endif /* SSGlobalVar_h */










