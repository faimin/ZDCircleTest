//
//  ZDCircleView.m
//  ZDTest
//
//  Created by 符现超 on 16/4/15.
//  Copyright © 2016年 Zero.D.Saber. All rights reserved.
//

#import "ZDCircleView.h"

#define UIColorFromHEX(rgbValue)                                        \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0    \
                green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0       \
                 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha: 1.0]    \


@interface UIColor (RGB)

- (CGFloat)R;

- (CGFloat)G;

- (CGFloat)B;

@end


@implementation ZDCircleView


/*
 http://blog.csdn.net/rhljiayou/article/details/9919713
 
 http://www.cnblogs.com/xingchen/p/3615346.html
 */

- (void)drawRect:(CGRect)rect
{
    UIColor *color = UIColorFromHEX(0xb5b5b5);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(contextRef, color.R, color.G, color.B, 1);
    CGContextSetLineWidth(contextRef, 5.0f);
    CGContextAddArc(contextRef, 150, 150, 150, 0, M_PI*2, 0);
    CGContextDrawPath(contextRef, kCGPathStroke);
    
    
    UIColor *newColor = UIColorFromHEX(0xff6060);
    //CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(contextRef, newColor.R, newColor.G, newColor.B, 1);
    CGContextSetLineWidth(contextRef, 5.0f);
    CGContextAddArc(contextRef, 150, 150, 150, 0, M_PI, 1);
    CGContextDrawPath(contextRef, kCGPathStroke);
    
//    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
//    CGFloat colors[] =
//    {
//        1,1,1, 1.00,
//        1,1,0, 1.00,
//        1,0,0, 1.00,
//        1,0,1, 1.00,
//        0,1,1, 1.00,
//        0,1,0, 1.00,
//        0,0,1, 1.00,
//        0,0,0, 1.00,
//    };
//    CGGradientRef gradient = CGGradientCreateWithColorComponents
//    (rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));//形成梯形，渐变的效果
//    CGColorSpaceRelease(rgb);
    
}


@end



@implementation UIColor (RGB)

- (CGFloat)R
{
    CGFloat r, g, b = 0, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return r;
}

- (CGFloat)G
{
    CGFloat r, g, b = 0, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return g;
}

- (CGFloat)B
{
    CGFloat r, g, b = 0, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return b;
}

@end




