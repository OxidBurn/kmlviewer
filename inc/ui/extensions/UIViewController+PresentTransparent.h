//
//  UIViewController+PresentTransparent.h
//  SpeedyGecko
//
//  Created by Nikolay Chaban on 2/25/14.
//  Copyright (c) 2014 FuzzyZen Labs. All rights reserved.
//

@interface UIViewController (PresentTransparent)

/**
 *  Present transparent view controller
 *
 *  @param aViewController presented controller
 *  @param isAnimated      with animation
 *  @param anAlpha         controller view alfa value
 */
- (void) presentTransparentModalViewController: (UIViewController*) aViewController
                                      animated: (BOOL)              isAnimated
                                     withAlpha: (CGFloat)           anAlpha;

/**
 *  Dismiss transparent controller
 *
 *  @param animated          with animation
 *  @param dismissController dismissed controller
 */
- (void) dismissTransparentModalViewControllerAnimated: (BOOL) animated
                                            controller: (id)   dismissController;

@end
