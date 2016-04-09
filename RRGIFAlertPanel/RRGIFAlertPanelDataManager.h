//
//  RRAlertPanelDataManager.h
//  ImagePluginXcode
//
//  Created by Remi Robert on 09/04/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RRGIFAlertPanelDataManager : NSObject

+ (NSImage *)imageForKey:(NSString *)key;
+ (void)setUrl:(NSURL *)url forKey:(NSString *)key;

@end
