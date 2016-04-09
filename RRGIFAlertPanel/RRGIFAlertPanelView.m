//
//  RRAlertPanelView.m
//  ImagePluginXcode
//
//  Created by Remi Robert on 09/04/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

#import "RRGIFAlertPanelView.h"

@interface RRGIFAlertPanelView()

@property (nonnull, nonatomic, strong) NSTextView *textView;
@property (nonnull, nonatomic, strong) NSImageView *imageView;

@end

@implementation RRGIFAlertPanelView

- (NSImageView *)imageView {
    if (!_imageView) {
        NSRect frameImage = NSMakeRect(0, 0, self.frame.size.width, self.frame.size.height - 25);
        _imageView = [[NSImageView alloc] initWithFrame:frameImage];
        _imageView.imageScaling = NSImageScaleNone;
        _imageView.imageAlignment = NSImageAlignCenter;
        _imageView.animates = true;
        [_imageView setWantsLayer:true];
        _imageView.layer.masksToBounds = true;
        _imageView.canDrawSubviewsIntoLayer = true;
    }
    return _imageView;
}

- (NSTextView *)textView {
    if (!_textView) {
        NSRect frameText = NSMakeRect(0, 0, self.frame.size.width, self.frame.size.height - 2);
        _textView = [[NSTextView alloc] initWithFrame:frameText];
        _textView.textColor = [NSColor blackColor];
        _textView.font = [NSFont boldSystemFontOfSize:13];
        _textView.backgroundColor = [NSColor clearColor];
        [_textView setAlignment:NSTextAlignmentCenter];
    }
    return _textView;
}

- (instancetype)init:(NSRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.material = NSVisualEffectMaterialMediumLight;
        self.state = NSVisualEffectStateActive;
    }
    return self;
}

- (void)bindAlertPanel:(RRGIFAlertPanel *)alertPanel {
    
    [self addSubview:self.imageView];
    [self addSubview:self.textView];

    if (alertPanel.image) {
        self.imageView.image = alertPanel.image;
    }
    [self.textView setString:alertPanel.title];
}

@end
