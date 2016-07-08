//
//  Utility.m
//  GlebHoweTaskArchiveNames
//
//  Created by Nikolay Chaban on 2/4/16.
//  Copyright © 2016 GlebCherkashyn. All rights reserved.
//

#import "Utility.h"

@implementation Utility

#pragma mark - Dates -

+ (NSString*) getStringFromDate: (NSDate*)   date
                     withFormat: (NSString*) format
{
    NSString* dateWithString = @"";
    
    // Create instance of the date formatter for converting
    // nsdate to string
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    
    // if format not nil, apply custom format
    // if not, set default format
    if ( format )
    {
        dateFormatter.dateFormat = format;
    }
    else
    {
        // Set date fromat year/month/day hours(24)(hh - 12)/minutes
        dateFormatter.dateFormat = @"yyyy/MM/dd  HH:mm";
    }
    
    // Setup current used calendar
    dateFormatter.calendar = [NSCalendar currentCalendar];
    
    // Converting date to string with format
    dateWithString = [dateFormatter stringFromDate: date];
    
    return dateWithString;
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

#pragma mark - Strings -

+ (NSString*) getStringWithoutWhiteSpaces: (NSString*) string
{
    // Get name string from the text field
    NSCharacterSet* whiteSpacesSet = [NSCharacterSet whitespaceCharacterSet];
    
    NSString* content = [string stringByTrimmingCharactersInSet: whiteSpacesSet];
    
    return content;
}

@end
