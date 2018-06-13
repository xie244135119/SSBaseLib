//
//  NSObject+BindValue.m
//  整合框架
//
//  Created by SunSet on 14-3-21.
//  Copyright (c) 2014年 SunSet. All rights reserved.
//


#import "NSObject+SSBindValue.h"
#import <objc/runtime.h>


@implementation NSObject (BindValue)


- (void)bindValue:(id)value forKey:(NSString *)key
{
//    if (value == nil) return;
    
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(key), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)bindCopyValue:(id)value forKey:(NSString *)key
{
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(key), value, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)bindWeakValue:(id)value forKey:(NSString *)key
{
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(key), value, OBJC_ASSOCIATION_ASSIGN);
}

- (id)getBindValueForKey:(NSString *)key
{
    return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(key));
}


- (void)removeBindObjects
{
    objc_removeAssociatedObjects(self);
}


- (NSArray *)propertyList
{
    unsigned int properycount = 0;
    NSMutableArray *array = [[NSMutableArray alloc]init];
    objc_property_t *propertys = class_copyPropertyList([self class], &properycount);
    for (int i =0; i<properycount; i++) {
        objc_property_t property = propertys[i];
        const char *propertyname = property_getName(property);
        [array addObject:[NSString stringWithUTF8String:propertyname]];
    }
    
    return array;
}




@end





