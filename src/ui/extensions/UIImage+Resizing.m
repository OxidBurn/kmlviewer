//
//  UIImage+Resizing.m
//  Browse
//
//  Created by Chaban Nikolay on 4/9/14.
//  Copyright __MyCompanyName__ 2014. All rights reserved.
//


#import "UIImage+Resizing.h"


@implementation UIImage(Resizing)


- (UIImage*) imageResizedToSize: (CGSize) size
										   inPoints: (BOOL)   usePoints
{
	// Check for Retina display and then double the size of image (we assume size is in points)
	if (usePoints && [[UIScreen mainScreen] respondsToSelector: @selector(scale)])
	{
		CGFloat scale = [[UIScreen mainScreen] scale];
		
		size.width  *= scale;
		size.height *= scale;
	}

	
	// Create context on which image will be drawn
	UIGraphicsBeginImageContext(size);
	
	// Draw image on this context used provided size
	[self drawInRect: CGRectMake(0, 0, size.width, size.height)];
	
	// Convert context to an image
	UIImage* resizedImage = UIGraphicsGetImageFromCurrentImageContext();    

	// Remove context
	UIGraphicsEndImageContext();
	
	
	return resizedImage;
}


@end