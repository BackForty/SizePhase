//
//  AppDelegate.m
//  Sizing Phase
//
//  Created by Chris Cahoon on 1/27/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate 

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  // Insert code here to initialize your application
  [self switchImages:nil];
}

- (IBAction)switchImages:(id)sender {
  NSArray *imageNames = [self resizedImageNames];

  NSUInteger randomIndex = arc4random() % [imageNames count];

  if(![imageNames count]) {
    NSLog(@"no images have been discovered--are there any images to convert?");
    return;
  }

  NSString *imageName = imageNames[randomIndex];

  self.tinyImageView.image = [self imageNamed:imageName withPrefix:@"Tiny-"];
  self.smallImageView.image = [self imageNamed:imageName withPrefix:@"Small-"];
  self.mediumImageView.image = [self imageNamed:imageName withPrefix:@"Medium-"];
  self.largeImageView.image = [self imageNamed:imageName withPrefix:@"Large-"];
}

// Search our bundle for images we have resized
- (NSArray *)resizedImageNames {
  NSBundle *bundle = [NSBundle mainBundle];

  NSArray *JPGs = [bundle pathsForResourcesOfType:@"jpg" inDirectory:nil];
  NSMutableArray *imageNames = [NSMutableArray array];

  for (NSString *path in JPGs) {
    NSString *filename = path.lastPathComponent;

    if ([filename hasPrefix:@"Small-"]) {
      NSString *sharedSuffix = [filename substringFromIndex:[@"Small-" length]];
      [imageNames addObject:sharedSuffix];
    }
  }

  return imageNames;
}

- (NSImage *)imageNamed:(NSString *)name withPrefix:(NSString* )prefix {
  NSString *fullName = [NSString stringWithFormat:@"%@%@", prefix, name];
  return [NSImage imageNamed:fullName];
}

@end
