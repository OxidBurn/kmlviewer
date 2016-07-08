//
//  NSObject+Blocks.h
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright (c) 2016 Nikolay Chaban. All rights reserved.
//


@implementation NSOperationQueue(Class)


- (NSArray*) allOperationsWithClass: (Class) operationClass
{
	NSMutableArray* operations = [NSMutableArray array];
	
	for (NSOperation* operation in self.operations)
	{
		if ([operation isKindOfClass: operationClass])
			[operations addObject: operation];
	}
	
	return [NSArray arrayWithArray: operations];
}


- (void) cancelAllOperationsWithClass: (Class) operationClass
{
	[[self allOperationsWithClass: operationClass] makeObjectsPerformSelector: @selector(cancel)];
}


-(BOOL) hasOperationOfClassInQueue: (Class) operationClass{
    for (NSOperation* operation in self.operations) {
        if ([operation isKindOfClass: operationClass]) {
            return YES;
        }
    }
    return NO;
}

@end