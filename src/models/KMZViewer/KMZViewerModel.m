//
//  KMZViewerModel.m
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright © 2016 Nikolay Chaban. All rights reserved.
//

// Frameworks
#import "ZipKit.h"

// Classes
#import "KMZViewerModel.h"

@interface KMZViewerModel()

// properties

@property (strong, nonatomic) NSString* kmzFilePath;

// methods


@end

@implementation KMZViewerModel

#pragma mark - Initialization -

- (instancetype) initWithKMZFilePath: (NSString*) path
{
    if ( self = [super init] )
    {
        self.kmzFilePath = path;
    }
    
    return self;
}

@end
