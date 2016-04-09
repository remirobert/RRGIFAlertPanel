//
//  NSObject+MethodSwizzler.m
//  ImagePluginXcode
//
//  Created by Remi Robert on 09/04/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

#import "NSObject+MethodSwizzler.h"
#import <objc/runtime.h>

@implementation NSObject (MethodSwizzler)

+ (void)swizzleWithOriginalSelector:(SEL)originalSelector swizzledSelector:(SEL) swizzledSelector isClassMethod:(BOOL)isClassMethod {
    Class cls = [self class];
    
    Method originalMethod;
    Method swizzledMethod;
    
    if (isClassMethod) {
        originalMethod = class_getClassMethod(cls, originalSelector);
        swizzledMethod = class_getClassMethod(cls, swizzledSelector);
    }
    else {
        originalMethod = class_getInstanceMethod(cls, originalSelector);
        swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
    }
    if (!originalMethod) {
        return;
    }
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

@end
