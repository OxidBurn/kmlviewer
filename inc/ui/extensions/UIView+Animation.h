//
//  UIView+Animation.h
//  UIAnimationSamples
//
//  Created by Nikolay Chaban on 10/24/12.
//  Copyright (c) 2011 Prophonix. All rights reserved.
//

typedef void(^CompletionBlock)();

@interface UIView (Animation)

- (void)     moveTo: (CGPoint)                destination
           duration: (float)                  secs
             option: (UIViewAnimationOptions) option
withCompletionBlock: (CompletionBlock)        completionBlock;

- (void) downUnder: (float)                  secs
            option: (UIViewAnimationOptions) option;

- (void) addSubviewWithZoomInAnimation: (UIView*)                view
                              duration: (float)                  secs
                                option: (UIViewAnimationOptions) option;

- (void) removeWithZoomOutAnimation: (float)                  secs
                             option: (UIViewAnimationOptions) option;

- (void) addSubviewWithFadeAnimation: (UIView*)                view
                            duration: (float)                  secs
                              option: (UIViewAnimationOptions) option;

- (void) removeWithSinkAnimation: (int) steps;

- (void) removeWithSinkAnimationRotateTimer: (NSTimer*) timer;

- (void) zoomOutAnimationWithRestoring: (CGFloat)                secs
                               options: (UIViewAnimationOptions) option
                   withCompletionBlock: (CompletionBlock)        block;

@end
