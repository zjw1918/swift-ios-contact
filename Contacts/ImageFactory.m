//
//  ImageFactory.m
//  Contacts
//
//  Created by mega on 2017/12/11.
//  Copyright © 2017年 mega. All rights reserved.
//

#import "ImageFactory.h"

@implementation ImageFactory

+ (UIImage *) generateDefaultImageOfSize:(CGSize)size
{
    // make frame and get context
    CGRect frame = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // draw white background and yellow circle
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextFillRect(context, frame);
    CGContextSetFillColorWithColor(context, [[UIColor yellowColor] CGColor]);
    CGContextFillEllipseInRect(context, frame);
    
    CGFloat x = frame.origin.x + size.width / 2;
    CGFloat y = frame.origin.y + size.height / 2;
    CGPoint center = CGPointMake(x, y);
    
    // draw eyes
    CGColorRef black = [[UIColor blackColor] CGColor];
    CGRect lEyeRect = CGRectMake(center.x - 50, center.y - 50, 20, 20);
    CGRect rEyeRect = CGRectMake(center.x + 30, center.y - 50, 20, 20);
    CGContextSetFillColorWithColor(context, black);
    CGContextFillEllipseInRect(context, lEyeRect);
    CGContextFillEllipseInRect(context, rEyeRect);
    
    // draw smile
    CGContextSetLineWidth(context, 5.0);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, center.x - 50, center.y + 35);
    
    CGContextAddCurveToPoint(context,
                             center.x - 25, center.y + 50,
                             center.x + 25, center.y + 50,
                             center.x + 50, center.y + 35);
    CGContextStrokePath(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
