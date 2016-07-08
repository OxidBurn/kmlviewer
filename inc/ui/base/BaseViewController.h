//
//  BaseViewController.h
//  DoctorApp
//
//  Created by Chaban Nickolay on 9/16/13.
//  Copyright (c) 2013 Chaban Nickolay. All rights reserved.
//

// Extensions
#import "UIView+Utilities.h"
#import "UIView+Animation.h"
#import "UIViewController+Addons.h"
#import "UIViewController+PresentTransparent.h"

@interface BaseViewController : UIViewController

// properties


// methods

/**
 *  Setup navigation bar button with title
 *
 *  @param title    title value
 *  @param selector button action
 *
 *  @return navigation bar button by title with action
 */
- (UIBarButtonItem*) setupBarBtnWithTitle: (NSString*) title
                               withAction: (SEL)       selector;

/**
 *  Setup navigation bar button with image
 *
 *  @param image    image object
 *  @param selector selector
 *
 *  @return navigation bar button with image with action
 */
- (UIBarButtonItem*) setupBarBtnWithImage: (UIImage*) image
                               withAction: (SEL)      selector;

/**
 *  etup navigation bar button by type
 *
 *  @param systemItem bar button item type
 *
 *  @return navigation bar button by type
 */
- (UIBarButtonItem*) setupBarBtnWithType: (UIBarButtonSystemItem) systemItem;

/**
 *  Force rotate
 */
- (void) forceRotate;

@end
