//
//  ImagePluginXcode.h
//  ImagePluginXcode
//
//  Created by Remi Robert on 09/04/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

#import <AppKit/AppKit.h>

@class RRGIFAlertPanelPluginXcode;

static RRGIFAlertPanelPluginXcode *sharedPlugin;

@interface RRGIFAlertPanelPluginXcode : NSObject

+ (instancetype)sharedPlugin;
- (id)initWithBundle:(NSBundle *)plugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@end