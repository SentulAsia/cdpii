//
//  UIImage+PixelColor.h
//  cdpii
//
//  Created by saifuddin on 9/1/15.
//  Copyright (c) 2015 brainstorm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (PixelColor)

- (UIColor *)colorAtPoint:(CGPoint)pixelPoint;

@end