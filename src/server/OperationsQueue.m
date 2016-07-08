//
//  OperationsQueue.m
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright (c) 2016 Nikolay Chaban. All rights reserved.
//

#import "OperationsQueue.h"


//! Default max concurrent operation count
static const NSUInteger defaultMaxConcurrentOperationCount = 5;


@implementation OperationsQueue


#pragma mark -
#pragma mark General


+ (OperationsQueue*) operationQueue
{
	OperationsQueue* operationQueue = [[OperationsQueue alloc] init];

	// Set the default max count of concurrent operations
	[operationQueue setMaxConcurrentOperationCount: defaultMaxConcurrentOperationCount];
	
	return operationQueue;
}


@end
