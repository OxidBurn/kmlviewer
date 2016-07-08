//
//  NSArray+SelectorWithArguments.h
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright (c) 2016 Nikolay Chaban. All rights reserved.
//


@interface NSArray(SelectorWithArguments)

//! Make all objects in array perform selector with multiple arguments
- (void) makeObjectsPerformSelector: (SEL)   selector
							  			withArguments: (void*) arg1, ...;

//! Make all objects in array perform selector with single argument
- (void) makeObjectsPerformSelector: (SEL)   selector
							  			 withArgument: (void*) arg;

@end