//
//  KMLViewerAppDelegate.h
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright Nikolay Chaban 2016. All rights reserved.
//

#import "KMLViewerAppDelegate.h"

@interface KMLViewerAppDelegate()

@end


@implementation KMLViewerAppDelegate

@synthesize window;


#pragma mark General


+ (KMLViewerAppDelegate*) shared
{
	return (KMLViewerAppDelegate*)[[UIApplication sharedApplication] delegate];
}


- (void) dealloc
{
	self.window = nil;
} 


#pragma mark -
#pragma mark UIApplicationDelegate


- (BOOL)            application: (UIApplication*) application 
  didFinishLaunchingWithOptions: (NSDictionary*)  launchOptions
{
	return YES;
}


- (void) applicationWillTerminate: (UIApplication*) application
{
}


- (void) applicationDidReceiveMemoryWarning: (UIApplication*) application
{
	DbgLog(@"Application did receive memory warning!");
}


@end