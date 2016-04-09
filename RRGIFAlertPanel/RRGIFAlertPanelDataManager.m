//
//  RRAlertPanelDataManager.m
//  ImagePluginXcode
//
//  Created by Remi Robert on 09/04/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RRGIFAlertPanelDataManager.h"
#import "RRGIFAlertPanelStaticKeys.h"

@implementation RRGIFAlertPanelDataManager

+ (NSImage *)defaultBundleUrl:(NSString *)fileName {
    NSBundle *bundle = [NSBundle bundleWithIdentifier:@"com.remirobert.ImagePluginXcode"];
    return [bundle imageForResource:fileName];
}

+ (NSImage *)imageForKey:(NSString *)key {
    NSString *urlImage = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if (urlImage) {
        return [[NSImage alloc] initWithContentsOfURL:[NSURL URLWithString:urlImage]];
    }
    if ([key isEqualToString:SUCCEEDED_KEY]) {
        return [self defaultBundleUrl:DEFAULT_SUCCEEDED_FILE];
    }
    else if ([key isEqualToString:FAILED_KEY]) {
        return [self defaultBundleUrl:DEFAULT_FAILED_FILE];
    }
    return nil;
}

+ (void)setUrl:(NSURL *)url forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:[url description] forKey:key];
}

@end
