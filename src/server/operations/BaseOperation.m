//
//  BaseOperation.m
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright (c) 2016 Nikolay Chaban. All rights reserved.
//

#import "BaseOperation.h"

#import "OperationsQueue.h"


@interface BaseOperation()

//! Flag of finished operation
@property (nonatomic, assign) BOOL finished;

//! Flag of executing operation
@property (nonatomic, assign) BOOL executing;

@end


@implementation BaseOperation

@synthesize finished;
@synthesize executing;

@synthesize target;
@synthesize successSelector;
@synthesize failureSelector;
@synthesize progressSelector;
@synthesize cancelSelector;
@synthesize userInfo;

@synthesize successBlock;
@synthesize failureBlock;
@synthesize progressBlock;
@synthesize cancelBlock;


#pragma mark -
#pragma mark General


- (id) init
{
	if ((self = [super init]))
	{
		self.finished  = NO;
		self.executing = NO;
	}
	
	return self;
}


- (void) dealloc
{
	self.target        = nil;
	self.userInfo      = nil;
	
	self.successBlock  = nil;
	self.failureBlock  = nil;
	self.progressBlock = nil;
	self.cancelBlock   = nil;
}


#pragma mark -
#pragma mark Equivalnce


- (BOOL) isEqualToOperation: (BaseOperation*) operation
{
	return [self isEqual: operation];
}


#pragma mark -
#pragma mark Operation


- (void) start
{
	// Check if it's already cancelled, otherwise detach new thread,
	// and run operation main routine (should be implemented in subclass)
	if (![self isCancelled]) 
	{
    [self willChangeValueForKey: @"isExecuting"];
    self.executing = YES;
    
		[NSThread detachNewThreadSelector: @selector(main) 
														 toTarget: self 
													 withObject: nil];
    
		[self didChangeValueForKey:  @"isExecuting"];
  } 
	else 
	{
    [self willChangeValueForKey: @"isFinished"];
    self.finished = YES;
		[self didChangeValueForKey:  @"isFinished"];
  }
}


- (void) main
{
    @autoreleasepool {
        
        // Run operation main routine
        if ([self respondsToSelector: @selector(run)])
            [self performSelector: @selector(run)];
        
        // KVO stuff for NSOperationQueue: mark operation
        // as finished and not executing
        [self willChangeValueForKey: @"isFinished"];
        [self willChangeValueForKey: @"isExecuting"];
        
        self.finished  = YES;
        self.executing = NO;
        
        [self didChangeValueForKey: @"isExecuting"];
        [self didChangeValueForKey: @"isFinished"];
    }
}


- (BOOL) isExecuting
{
	return self.executing;
}


- (BOOL) isFinished
{
	return self.finished;
}


- (BOOL) isConcurrent
{
	return YES;
}


#pragma mark -
#pragma mark Notifications


- (void) notifyUsingSelector: (SEL)        selector
                    andBlock: (void (^)()) block
{
	if (self.target && [self.target respondsToSelector: selector])
		[self.target performSelectorOnMainThread: selector withObject: self waitUntilDone: YES];
	
	#if NS_BLOCKS_AVAILABLE
		if (block)
			[NSThread performBlockOnMainThread: block];
	#endif
}


- (void) notifyOnSuccess
{
	[self notifyUsingSelector: self.successSelector 
									 andBlock: self.successBlock];
}


- (void) notifyOnFailure
{
	[self notifyUsingSelector: self.failureSelector
									 andBlock: self.failureBlock];
}


- (void) notifyOnProgress
{
	[self notifyUsingSelector: self.progressSelector 
									 andBlock: self.progressBlock];
}


- (void) notifyOnCancel
{
	[self notifyUsingSelector: self.cancelSelector 
									 andBlock: self.cancelBlock];
}


@end