//
//  MainModel.h
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright © 2016 Nikolay Chaban. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainModel : NSObject

// properties

@property (strong, nonatomic, readonly) NSArray* arrayOfFiles;

// methods

- (NSString*) getPathOfFileWithIndex: (NSUInteger) index;

@end
