//
//  Utils.m
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright (c) 2016 Nikolay Chaban. All rights reserved.
//

#import "Utils.h"


//! Default date formatter
static NSDateFormatter* defaultDateFormatter = nil;


@implementation Utils


#pragma mark -
#pragma mark Fonts


+ (UIFont*) defaultFontOfSize: (CGFloat) size
{
	return [UIFont systemFontOfSize: size];
}


+ (UIFont*) defaultMediumFontOfSize: (CGFloat) size
{
	return [UIFont systemFontOfSize: size];
}


+ (UIFont*) defaultBoldFontOfSize: (CGFloat) size
{
	return [UIFont boldSystemFontOfSize: size];
}


#pragma mark -
#pragma mark Date/time


+ (NSDateFormatter*) defaultDateFormatter
{
  if (defaultDateFormatter == nil)
  {
    defaultDateFormatter = [[NSDateFormatter alloc] init];

    defaultDateFormatter.dateFormat = @"MM/dd/yyyy hh:mm:ss a";
    defaultDateFormatter.locale     = [[NSLocale alloc] initWithLocaleIdentifier: @"en_US"];
    defaultDateFormatter.timeZone   = [NSTimeZone timeZoneWithAbbreviation: @"GMT"];
  }

  return defaultDateFormatter;
}


#pragma mark -
#pragma mark Misc


+ (BOOL) isDeviceJailbroken
{
	BOOL jailbreak = NO;
	
	if ([[NSFileManager defaultManager] fileExistsAtPath: @"/bin/bash"])
		jailbreak = YES;
	else
	if ([[NSFileManager defaultManager] fileExistsAtPath: @"/Applications/Cydia.app"])
		jailbreak = YES;
	
	return jailbreak;
} 


+ (BOOL) isValidEmail: (NSString*) email
{
  NSString* emailRegEx =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
  
  NSPredicate* predicate = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", emailRegEx];
  
  return [predicate evaluateWithObject: [email lowercaseString]];
}

#pragma mark - App root directory -

+ (NSString*) getPathToTemporaryDirectoryWithPath: (NSString*) filePath
{
    NSString* newFilePath = [NSTemporaryDirectory() stringByAppendingString: filePath];
    
    return newFilePath;
}

+ (NSArray*) getFolderItems: (NSString*) folderPath
{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    
    NSError* gettingFilesError = nil;
    
    NSArray* folderContent = [fileManager contentsOfDirectoryAtPath: folderPath
                                                              error: &gettingFilesError];
    
    if ( gettingFilesError )
    {
        NSLog(@"Problem with getting files list from folder: %@", gettingFilesError.localizedDescription);
    }
    
    return folderContent;
}


@end