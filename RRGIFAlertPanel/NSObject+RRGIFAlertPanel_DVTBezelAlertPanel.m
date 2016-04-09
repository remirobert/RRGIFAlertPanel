//
//  NSObject+ImagePlugin_DVTBezelAlertPanel.m
//  ImagePluginXcode
//
//  Created by Remi Robert on 09/04/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

#import "NSObject+RRGIFAlertPanel_DVTBezelAlertPanel.h"
#import "NSObject+MethodSwizzler.h"
#import <Cocoa/Cocoa.h>
#include <objc/objc.h>
#include <objc/runtime.h>
#include <objc/message.h>
#import "DVTBezelAlertPanel.h"
#import "RRGIFAlertPanel.h"
#import "RRGIFAlertPanelView.h"

static const NSString *defaultMessageAlertPanel = @"                            ";

@interface NSObject ()

- (id)initWithIcon:(id)arg1 message:(id)arg2 parentWindow:(id)arg3 duration:(double)arg4;

@end

@implementation NSObject (RRGIFAlertPanel_DVTBezelAlertPanel)

+ (void)load {
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        [NSClassFromString(@"DVTBezelAlertPanel") swizzleWithOriginalSelector:@selector(initWithIcon:message:parentWindow:duration:) swizzledSelector:@selector(RRGIFAlertPanel_initWithIcon:message:parentWindow:duration:) isClassMethod:NO];
    });
}

- (id)RRGIFAlertPanel_initWithIcon:(id)icon message:(id)message parentWindow:(id)window duration:(double)duration {
    RRGIFAlertPanel *alertPanel = [RRGIFAlertPanel instanceFromAlertMessage:message];
    id panelView = [self RRGIFAlertPanel_initWithIcon:nil message:defaultMessageAlertPanel parentWindow:window duration:3.5];
    
    NSRect frame = ((DVTBezelAlertPanel *)self).contentView.frame;
    
    RRGIFAlertPanelView *alertPanelView = [[RRGIFAlertPanelView alloc] initWithFrame:frame];
    [alertPanelView bindAlertPanel:alertPanel];
    
    [((DVTBezelAlertPanel *)self).contentView removeFromSuperview];
    ((DVTBezelAlertPanel *)self).contentView = alertPanelView;
    return panelView;
}

@end