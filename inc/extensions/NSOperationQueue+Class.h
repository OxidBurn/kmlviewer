//
//  NSOperationQueue+Class.h
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright (c) 2016 Nikolay Chaban. All rights reserved.
//


@interface NSOperationQueue(Class)

//! Get all operations in the queue with specified class
- (NSArray*) allOperationsWithClass: (Class) operationClass;

//! Cancel all operations in queue with specified class
- (void) cancelAllOperationsWithClass: (Class) operationClass;

//! Checks if queue has at least one operation with specified class
-(BOOL) hasOperationOfClassInQueue: (Class) operationClass;

@end