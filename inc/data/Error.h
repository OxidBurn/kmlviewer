//
//  Error.h
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright (c) 2016 Nikolay Chaban. All rights reserved.
//


//! List of available errors
typedef enum
{
	ErrorUndefined,
	ErrorGeneralFailure,
	ErrorNetworkConnection,
	ErrorDataParsing,
	ErrorDataConsistency,
	ErrorLogic,
	ErrorLocation,
}
ErrorType;


@interface Error : NSObject

//! Type
@property (nonatomic, assign) ErrorType type;

//! Description
@property (nonatomic, retain) NSString* description;


//! Create error
+ (id) error;

//! Create error for specified type
+ (id) errorWithType: (ErrorType) type;

//! Create error for specified type and description
+ (id) errorWithType: (ErrorType) type
		     description: (NSString*) description;

//! Conveninent constructors for creating errors
+ (id) undefinedError;
+ (id) generalFailureError;
+ (id) networkConnectionError;
+ (id) dataParsingError;
+ (id) dataConsistencyError;
+ (id) logicError;
+ (id) locationError;

@end