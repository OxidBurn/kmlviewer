//
//  BaseView.m
//  DoctorApp
//
//  Created by Chaban Nickolay on 9/16/13.
//  Copyright (c) 2013 Chaban Nickolay. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView


#pragma mark - Initialization -

- (id) initWithFrame: (CGRect) frame
{
    self = [super initWithFrame: frame];
    
    if (self)
    {
        // Initialization code
    }
    
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
}


#pragma mark - Utils -

- (UIButton*) setupBtnWithImage: (UIImage*) image
                      withFrame: (CGRect)   frame
                     withAction: (SEL)      selector
{
    UIButton* btn = [UIButton buttonWithType: UIButtonTypeCustom];
    
    btn.frame = frame;
    
    [btn setImage: image
         forState: UIControlStateNormal];
    [btn addTarget: self
            action: selector
  forControlEvents: UIControlEventTouchUpInside];
    
    return btn;
}

@end
