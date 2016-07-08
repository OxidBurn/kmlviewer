//
//  BaseOperation.h
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright (c) 2016 Nikolay Chaban. All rights reserved.
//


@interface BaseOperation : NSOperation

//! Target
@property (nonatomic, retain) NSObject* target;

//! Success selector 
@property (nonatomic, assign) SEL successSelector;

//! Failure selector 
@property (nonatomic, assign) SEL failureSelector;

//! Progress selector
@property (nonatomic, assign) SEL progressSelector;

//! Cancel selector
@property (nonatomic, assign) SEL cancelSelector;

//! User info
@property (nonatomic, retain) NSDictionary* userInfo;


//! Success block
@property (nonatomic, copy) void (^successBlock)();

//! Failure block
@property (nonatomic, copy) void (^failureBlock)();

//! Progress block
@property (nonatomic, copy) void (^progressBlock)();

//! Cancel block
@property (nonatomic, copy) void (^cancelBlock)();


//! Notify on success
- (void) notifyOnSuccess;

//! Notify on failure
- (void) notifyOnFailure;

//! Notify on progress
- (void) notifyOnProgress;

//! Notify on cancel
- (void) notifyOnCancel;

@end
