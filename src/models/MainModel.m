//
//  MainModel.m
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright © 2016 Nikolay Chaban. All rights reserved.
//

// Classes
#import "MainModel.h"
#import "Utils.h"

@interface MainModel()

// properties

@property (strong, nonatomic) NSArray* arrayOfFiles;

// methods


@end

@implementation MainModel

#pragma mark - Properties -

- (NSArray*) arrayOfFiles
{
    if ( _arrayOfFiles == nil )
    {
        NSArray* itemsArray = [Utils getFolderItems: [self getPathToKMZFolder]];
        
        _arrayOfFiles = [self getArrayWithItemsWithoutExtensions: itemsArray];
    }
    
    return _arrayOfFiles;
}

#pragma mark - Public methods -

- (NSString*) getPathOfFileWithIndex: (NSUInteger) index
{
    NSString* fileName = self.arrayOfFiles[index];
    
    NSString* filePath = [[self getPathToKMZFolder] stringByAppendingFormat: @"%@.kmz", fileName];
    
    return filePath;
}

#pragma mark - Internal method -

- (NSString*) getPathToKMZFolder
{
    NSString* folderPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingFormat: @"/KMZ files/"];
    
    return folderPath;
}

- (NSArray*) getArrayWithItemsWithoutExtensions: (NSArray*) array
{
    __block NSMutableArray* tmpArr = [NSMutableArray new];
    
    [array enumerateObjectsUsingBlock: ^(NSString* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        obj = [obj stringByReplacingOccurrencesOfString: [NSString stringWithFormat: @".%@", obj.pathExtension]
                                             withString: @""];
        
        [tmpArr addObject: obj];
        
    }];
    
    return tmpArr.copy;
}

@end
