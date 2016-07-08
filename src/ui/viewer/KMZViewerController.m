//
//  KMZViewerController.m
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright © 2016 Nikolay Chaban. All rights reserved.
//

// Classes
#import "KMZViewerController.h"
#import "KMZViewerViewModel.h"

@interface KMZViewerController ()

// properties

@property (strong, nonatomic) KMZViewerViewModel* viewModel;

@property (weak, nonatomic) IBOutlet MKMapView* mapView;

// methods

- (IBAction) onChangeMapView: (UISegmentedControl*) sender;


@end

@implementation KMZViewerController

#pragma mark - Life cycle -

- (void) viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) loadView
{
    [super loadView];
}

#pragma mark - Memory managment -

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public methods -

- (void) setKMZFilePath: (NSString*) filePath
{
    
}

#pragma mark - Internal methods -

- (IBAction) onChangeMapView: (UISegmentedControl*) sender
{
    self.mapView.mapType = sender.selectedSegmentIndex;
}

@end
