//
//  Utils.h
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright Nikolay Chaban 2016. All rights reserved.
//


@interface Utils : NSObject

//! Create default regular font of the given size
+ (UIFont*) defaultFontOfSize: (CGFloat) size;

//! Create default medium font of the given size
+ (UIFont*) defaultMediumFontOfSize: (CGFloat) size;

//! Create default bold font of the given size
+ (UIFont*) defaultBoldFontOfSize: (CGFloat) size;

+ (NSArray*) getFolderItems: (NSString*) folderPath;

@end