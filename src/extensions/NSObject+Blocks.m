//
//  NSObject+Blocks.m
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright (c) 2016 Nikolay Chaban. All rights reserved.
//


@implementation NSObject(Blocks)


- (void) performBlock: (void (^)()) block
{
	[[NSThread currentThread] performBlock: block];
}


- (void) performBlockInBackground: (void (^)()) block
{
	[[NSThread currentThread] performBlockInBackground: block];
}


- (void) performBlock: (void (^)())     block
					 afterDelay: (NSTimeInterval) delay
{
	[[NSThread currentThread] performBlock: block 
															afterDelay: delay];
}


@end