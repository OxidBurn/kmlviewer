//
//  KMZViewerViewModel.h
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright © 2016 Nikolay Chaban. All rights reserved.
//

// Frameworks
#import <Foundation/Foundation.h>
@import MapKit;

@interface KMZViewerViewModel : NSObject <MKMapViewDelegate>

// properties


// methods

- (instancetype) initWithKMZFilePath: (NSString*) path;

- (void) setMapKit: (MKMapView*) map;


@end
