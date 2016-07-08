//
//  BaseViewController.m
//  DoctorApp
//
//  Created by Chaban Nickolay on 9/16/13.
//  Copyright (c) 2013 Chaban Nickolay. All rights reserved.
//

// Controllers
#import "BaseViewController.h"

@interface BaseViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

// properties

// methods

@end

@implementation BaseViewController

#pragma mark - Initialization -

- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        
    }
    
    return self;
}


#pragma mark - Lifecycle -

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    if ([self respondsToSelector: @selector(setEdgesForExtendedLayout:)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void) viewWillAppear: (BOOL) animated
{
    [super viewWillAppear: animated];
    
    self.navigationController.toolbarHidden = NO;
}

- (void) loadView
{
    [super loadView];
}


#pragma mark - Memory managment -

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Rotations -

- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) toInterfaceOrientation
{
    return YES;
}

- (BOOL) shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask) supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (void) forceRotate
{
    //force portrait orientation without private methods.
    UIViewController* c = [[UIViewController alloc] init];
    
    [self presentViewController: c
                       animated: NO
                     completion: nil];
    [self dismissViewControllerAnimated: NO
                             completion: nil];
}


#pragma mark - Utils -

- (UIBarButtonItem*) setupBarBtnWithTitle: (NSString*) title
                               withAction: (SEL)       selector
{
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle: title
                                                             style: UIBarButtonItemStylePlain
                                                            target: self
                                                            action: selector];
    
    return item;
}

- (UIBarButtonItem*) setupBarBtnWithImage: (UIImage*) image
                               withAction: (SEL)      selector
{
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage: image
                                                             style: UIBarButtonItemStylePlain
                                                            target: self
                                                            action: selector];
    
    return item;
}

- (UIBarButtonItem*) setupBarBtnWithType: (UIBarButtonSystemItem) systemItem
{
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: systemItem
                                                                          target: nil
                                                                          action: nil];
    
    return item;
}

#pragma mark - Injection -

- (void) updateOnClassInjection
{
    
}

@end
