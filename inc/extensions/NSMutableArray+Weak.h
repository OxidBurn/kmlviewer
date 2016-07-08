//
//  NSMutableArray+Weak.h
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright (c) 2016 Nikolay Chaban. All rights reserved.
//


@interface NSMutableArray(Weak)

//! Create mutable array with weak references
+ (id) mutableArrayUsingWeakReferences;

//! Create mutable array with weak references with given capacity
+ (id) mutableArrayUsingWeakReferencesWithCapacity: (NSUInteger) capacity;

@end