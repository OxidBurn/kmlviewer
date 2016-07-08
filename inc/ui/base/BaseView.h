//
//  BaseView.h
//  DoctorApp
//
//  Created by Chaban Nickolay on 9/16/13.
//  Copyright (c) 2013 Chaban Nickolay. All rights reserved.
//

// Categories
#import "UIView+Utilities.h"
#import "UIView+Animation.h"

@interface BaseView : UIView

// properties


// methods

- (UIButton*) setupBtnWithImage: (UIImage*) image
                      withFrame: (CGRect)   frame
                     withAction: (SEL)      selector;


@end
