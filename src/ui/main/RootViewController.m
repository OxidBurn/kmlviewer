//
//  RootViewController.m
//  KMLViewer
//
//  Created by Nikolay Chaban on 7/8/16.
//  Copyright © 2016 Nikolay Chaban. All rights reserved.
//

// Classes
#import "RootViewController.h"
#import "MainViewModel.h"

@interface RootViewController()

// properties

@property (weak, nonatomic) IBOutlet UITableView* kmlFilesList;

@property (strong, nonatomic) MainViewModel* viewModel;

// methods

- (void) initUI;

@end

@implementation RootViewController

#pragma mark - Life cycle -

- (void) loadView
{
    [super loadView];
    
    [self initUI];
}


#pragma mark - Properties -

#pragma mark - Properties -

- (MainViewModel*) viewModel
{
    if ( _viewModel == nil )
    {
        _viewModel = [[MainViewModel alloc] init];
    }
    
    return _viewModel;
}

#pragma mark - Internal methods -

- (void) initUI
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.kmlFilesList.dataSource = self.viewModel;
    self.kmlFilesList.delegate   = self.viewModel;
}

@end
