//
//  KMZViewerViewModel.m
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright © 2016 Nikolay Chaban. All rights reserved.
//

// Classes
#import "KMZViewerViewModel.h"
#import "KMZViewerModel.h"

@interface KMZViewerViewModel()

// properties

@property (strong, nonatomic) MKMapView* mapView;

@property (strong, nonatomic) KMZViewerModel* model;

// methods

- (void) setupDefaults;


@end

@implementation KMZViewerViewModel

#pragma mark - Initialization -

- (instancetype) initWithKMZFilePath: (NSString*) path
{
    if ( self = [super init] )
    {
        
    }
    
    return self;
}

#pragma mark - Properties -

- (void) setupModel: (NSString*) filePath
{
    if ( self.model == nil )
    {
        self.model = [[KMZViewerModel alloc] init];
    }
}


#pragma mark - Public methods -

- (void) setMapKit: (MKMapView*) map
{
    self.mapView = map;
}

@end
