//
//  AppDelegate.h
//  Sizing Phase
//
//  Created by Chris Cahoon on 1/27/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSCollectionViewDelegate>

@property (assign) IBOutlet NSWindow *window;

@property IBOutlet NSImageView *tinyImageView;
@property IBOutlet NSImageView *smallImageView;
@property IBOutlet NSImageView *mediumImageView;
@property IBOutlet NSImageView *largeImageView;;

@end
