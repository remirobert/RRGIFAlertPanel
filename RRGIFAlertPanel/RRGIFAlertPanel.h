//
//  RRAlertPanel.h
//  ImagePluginXcode
//
//  Created by Remi Robert on 09/04/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RRGIFAlertPanel : NSObject

@property (nonnull, nonatomic, strong) NSString *title;
@property (nonnull, nonatomic, strong) NSImage *image;

+ (nullable instancetype)instanceFromAlertMessage:(nonnull NSString *)message;

@end
