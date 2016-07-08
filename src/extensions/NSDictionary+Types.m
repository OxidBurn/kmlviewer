//
//  NSDictionary+Types.m
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright (c) 2016 Nikolay Chaban. All rights reserved.
//

#import "NSDictionary+Types.h"


@implementation NSDictionary(Types)


- (id) valueForKeyPath: (NSString*) keyPath
							withType: (NSString*) type
{
	id object = [self valueForKeyPath: keyPath];
	
	Class class = NSClassFromString(type);
	
	if ([object isKindOfClass: class])
		return object;
	else
	if ([type isEqualToString: @"NSString"] && ![object isKindOfClass: [NSNull class]])
		return [object description];
	
	return nil;
}


- (id) valueOrNilForKeyPath: (id) keyPath
{
  id object = [self valueForKeyPath: keyPath];
  
	if ([object isKindOfClass: [NSNull class]])
		return nil;
  
  return object;
}


@end