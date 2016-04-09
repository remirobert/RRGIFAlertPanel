//
//  ImagePluginXcode.m
//  ImagePluginXcode
//
//  Created by Remi Robert on 09/04/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

#import "RRGIFAlertPanelPluginXcode.h"
#import "RRGIFAlertPanelDataManager.h"
#import "RRGIFAlertPanelStaticKeys.h"

@interface RRGIFAlertPanelPluginXcode()

@property (nonatomic, strong, readwrite) NSBundle *bundle;
@property (nonatomic, strong) NSMutableSet *notificationSet;
@end

@implementation RRGIFAlertPanelPluginXcode

+ (instancetype)sharedPlugin {
    return sharedPlugin;
}

- (id)initWithBundle:(NSBundle *)plugin {
    if (self = [super init]) {
        self.bundle = plugin;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didApplicationFinishLaunchingNotification:)
                                                     name:NSApplicationDidFinishLaunchingNotification
                                                   object:nil];
        
        self.notificationSet = [NSMutableSet new];
    }
    return self;
}

- (void)didApplicationFinishLaunchingNotification:(NSNotification*)noti {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSApplicationDidFinishLaunchingNotification object:nil];
    
    NSMenuItem *menuItem = [[NSApp mainMenu] itemWithTitle:@"Edit"];
    if (menuItem) {
        [[menuItem submenu] addItem:[NSMenuItem separatorItem]];
        NSMenu *menu = [[NSMenu alloc] init];
        
        NSMenuItem *actionMenuItem = [[NSMenuItem alloc] initWithTitle:MENU_MAIN_CONFIGURATION
                                                                action:nil keyEquivalent:@""];
        NSMenuItem *submenu1 = [[NSMenuItem alloc] initWithTitle:MENU_SUB_ITEM_CHANGE_SUCCEEDED
                                                          action:@selector(doMenuActionChangeSucceededImage) keyEquivalent:@""];
        
        NSMenuItem *submenu2 = [[NSMenuItem alloc] initWithTitle:MENU_SUB_ITEM_CHANGE_FAILED
                                                          action:@selector(doMenuActionChangeFailedImage) keyEquivalent:@""];
        
        
        [actionMenuItem setTarget:self];
        [submenu1 setTarget:self];
        [submenu2 setTarget:self];
        
        [actionMenuItem setSubmenu:menu];
        [menu addItem:submenu1];
        [menu addItem:submenu2];
        [[menuItem submenu] addItem:actionMenuItem];
    }
}

- (void)displayFinderPrompt:(NSString *)key {
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    
    [panel setCanChooseFiles:YES];
    [panel setCanChooseDirectories:NO];
    [panel setAllowsMultipleSelection:false];
    [panel setAllowedFileTypes:[NSArray arrayWithObject:@"gif"]];
    
    [panel beginWithCompletionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {
            NSURL *fileUrl = [[panel URLs] firstObject];
            if (fileUrl) {
                [RRGIFAlertPanelDataManager setUrl:fileUrl forKey:key];
            }
        }
    }];
}

- (void)doMenuActionChangeSucceededImage {
    [self displayFinderPrompt:SUCCEEDED_KEY];
}

- (void)doMenuActionChangeFailedImage {
    [self displayFinderPrompt:FAILED_KEY];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
