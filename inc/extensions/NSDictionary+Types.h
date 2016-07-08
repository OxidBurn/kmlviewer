//
//  NSDictionary+Types.h
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright (c) 2016 Nikolay Chaban. All rights reserved.
//


@interface NSDictionary(Types)

//! Returns value for the given key path with given type
- (id) valueForKeyPath: (NSString*) keyPath
							withType: (NSString*) type;

//! Returns value or nil if object is kind of NSNull
- (id) valueOrNilForKeyPath: (id) key;

@end