//
//  UIImage+Resizing.h
//  Browse
//
//  Created by Chaban Nikolay on 4/9/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//


@interface UIImage(Resizing)

//! Resize image to the specified size
- (UIImage*) imageResizedToSize: (CGSize) size
                       inPoints: (BOOL)   usePoints;

@end