//
//  NSThread+Blocks.h
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright (c) 2016 Nikolay Chaban. All rights reserved.
//


@interface NSThread(Blocks)

//! Perform block on main thread
+ (void) performBlockOnMainThread: (void (^)()) block;

//! Perform block in background
+ (void) performBlockInBackground: (void (^)()) block;

//! Perform block
- (void) performBlock: (void (^)()) block;

//! Perform block and optionally wait until done
- (void) performBlock: (void (^)()) block 
				waitUntilDone: (BOOL)       wait;

//! Perform block after delay
- (void) performBlock: (void (^)())     block 
           afterDelay: (NSTimeInterval) delay;


@end