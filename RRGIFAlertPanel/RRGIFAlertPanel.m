//
//  RRAlertPanel.m
//  ImagePluginXcode
//
//  Created by Remi Robert on 09/04/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RRGIFAlertPanel.h"
#import "RRGIFAlertPanelDataManager.h"
#import "RRGIFAlertPanelStaticKeys.h"

@implementation RRGIFAlertPanel

- (instancetype)init:(NSString *)title urlPicture:(NSImage *)image {
    self = [super init];
    
    if (self) {
        self.title = title;
        self.image = image;
    }
    return self;
}

+ (nullable instancetype)instanceFromAlertMessage:(nonnull NSString *)message {
    RRGIFAlertPanel *alert;
    __block NSImage *image = [RRGIFAlertPanelDataManager imageForKey:message];
    __block NSString *title;
    
    if ([message isEqualToString:SUCCEEDED_KEY]) {
        title = @"✅ Build Succeeded";
    }
    else if ([message isEqualToString:FAILED_KEY]) {
        title = @"❌ Build Failed";
    }
    alert = [[RRGIFAlertPanel alloc] init:title urlPicture:image];
    return alert;
}

@end
