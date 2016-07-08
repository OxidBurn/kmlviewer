//
//  Error.m
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright (c) 2016 Nikolay Chaban. All rights reserved.
//

#import "Error.h"


@implementation Error

@synthesize type;
@synthesize description;


#pragma mark -
#pragma mark General


+ (id) error
{
	return [[Error alloc] init];
}


+ (id) errorWithType: (ErrorType) type
{
	Error* error = [Error error];
	
	error.type = type;
	
	return error;
}

+ (id) errorWithType: (ErrorType) type
		     description: (NSString*) description
{
	Error* error = [Error error];
	
	error.type        = type;
	error.description = description;
	
	return error;
}


+ (id) undefinedError
{
	return [Error errorWithType: ErrorUndefined];
}


+ (id) generalFailureError
{
	return [Error errorWithType: ErrorGeneralFailure];
}


+ (id) networkConnectionError
{
	return [Error errorWithType: ErrorNetworkConnection];
}


+ (id) dataParsingError
{
	return [Error errorWithType: ErrorDataParsing];
}


+ (id) dataConsistencyError
{
	return [Error errorWithType: ErrorDataConsistency];
}


+ (id) logicError
{
	return [Error errorWithType: ErrorLogic];
}


+ (id) locationError
{
	return [Error errorWithType: ErrorLocation];
}


- (id) init
{
	if ((self = [super init]))
	{
		self.type = ErrorUndefined;
	}
	
	return self;
}


- (void) dealloc
{
	self.description = nil;
}


@end
