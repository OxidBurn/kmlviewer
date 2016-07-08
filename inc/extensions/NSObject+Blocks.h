//
//  NSObject+Blocks.h
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright (c) 2016 Nikolay Chaban. All rights reserved.
//


@interface NSObject(Blocks)

//! Perform block
- (void) performBlock: (void (^)()) block;

//! Perform block in background
- (void) performBlockInBackground: (void (^)()) block;

//! Perform block after delay
- (void) performBlock: (void (^)())     block
					 afterDelay: (NSTimeInterval) delay;

@end