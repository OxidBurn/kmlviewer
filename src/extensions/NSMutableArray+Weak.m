//
//  NSMutableArray+Weak.m
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright (c) 2016 Nikolay Chaban. All rights reserved.
//

#import "NSMutableArray+Weak.h"


@implementation NSMutableArray(Weak)


+ (id) mutableArrayUsingWeakReferences
{
	return [NSMutableArray mutableArrayUsingWeakReferencesWithCapacity: 0];
}


+ (id) mutableArrayUsingWeakReferencesWithCapacity: (NSUInteger)capacity 
{
	CFArrayCallBacks callbacks = {0, NULL, NULL, CFCopyDescription, CFEqual};

	return (id)CFBridgingRelease(CFArrayCreateMutable(0, capacity, &callbacks));
}


@end