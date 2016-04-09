//
//  NSObject+MethodSwizzler.h
//  ImagePluginXcode
//
//  Created by Remi Robert on 09/04/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MethodSwizzler)

+ (void)swizzleWithOriginalSelector:(SEL)originalSelector swizzledSelector:(SEL) swizzledSelector isClassMethod:(BOOL)isClassMethod;

@end
