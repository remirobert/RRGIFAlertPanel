//
//  RRAlertPanelView.h
//  ImagePluginXcode
//
//  Created by Remi Robert on 09/04/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RRGIFAlertPanel.h"

@interface RRGIFAlertPanelView : NSVisualEffectView

- (instancetype)init:(NSRect)frame;
- (void)bindAlertPanel:(RRGIFAlertPanel *)alertPanel;

@end
