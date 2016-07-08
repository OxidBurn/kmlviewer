//
//  UIViewController+PresentTransparent.m
//  SpeedyGecko
//
//  Created by Nikolay Chaban on 2/25/14.
//  Copyright (c) 2014 FuzzyZen Labs. All rights reserved.
//

// Categories
#import "UIViewController+PresentTransparent.h"

@implementation UIViewController (PresentTransparent)

- (void) presentTransparentModalViewController: (UIViewController*) aViewController
                                      animated: (BOOL)              isAnimated
                                     withAlpha: (CGFloat)           anAlpha
{
    UIView* view = aViewController.view;
    
    view.opaque = NO;
    
    if (isAnimated)
    {
        //Animated
        
        CGRect mainrect = self.view.bounds;
        CGRect newRect  = CGRectMake(0, mainrect.size.height, mainrect.size.width, mainrect.size.height);
        
        view.backgroundColor = [UIColor colorWithWhite: 0.000 alpha: anAlpha];
        
        [self.view addSubview: view];
        
        view.frame = newRect;
        
        [UIView animateWithDuration: 0.3
                         animations: ^{
                             
                             view.frame                 = mainrect;
                             aViewController.view.frame = mainrect;
                         }
                         completion: ^(BOOL finished) {
                             
                         }];
        
    }
    else
    {
        view.frame           = self.view.bounds;
        view.backgroundColor = [UIColor colorWithWhite: 0.000 alpha: anAlpha];
        
        [self.view addSubview: view];
    }
}

- (void) dismissTransparentModalViewControllerAnimated: (BOOL)              animated
                                            controller: (UIViewController*) dismissController
{
    if (animated)
    {
        CGRect mainrect = ((UIViewController*)dismissController).view.frame;
        CGRect newRect  = CGRectMake(0, mainrect.size.height + 320, mainrect.size.width, mainrect.size.height);
        
        [UIView animateWithDuration: 0.4
                         animations: ^{
                             
                             dismissController.view.frame = newRect;
                         }
                         completion: ^(BOOL finished) {
                             
                             [dismissController.view removeFromSuperview];
                         }];
    }
    else
    {
        [dismissController.view removeFromSuperview];
    }
}

@end
