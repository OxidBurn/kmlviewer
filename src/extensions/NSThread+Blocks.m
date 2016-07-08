//
//  NSThread+Blocks.m
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright (c) 2016 Nikolay Chaban. All rights reserved.
//

#import "NSThread+Blocks.h"


@implementation NSThread(Blocks)


+ (void) performBlockOnMainThread: (void (^)()) block
{
	[[NSThread mainThread] performBlock: block];
}


+ (void) performBlockInBackground: (void (^)()) block
{
	[NSThread performSelectorInBackground: @selector(runBlock:)
														 withObject: [block copy]];
}


+ (void) runBlock: (void (^)()) block
{
	block();
}


- (void) performBlock: (void (^)()) block
{
	if ([[NSThread currentThread] isEqual: self])
		block();
	else
		[self performBlock: block waitUntilDone: NO];
}


- (void) performBlock: (void (^)()) block 
				waitUntilDone: (BOOL)       wait
{
	[NSThread performSelector: @selector(runBlock:)
									 onThread: self
								 withObject: [block copy]
							waitUntilDone: wait];
}


- (void) performBlock: (void (^)())     block 
					 afterDelay: (NSTimeInterval) delay
{
	[self performSelector: @selector(performBlock:) 
						 withObject: [block copy] 
						 afterDelay: delay];
}

@end