//
//  CALayer+MaskLayer.m
//  WeatherApp
//
//  Created by lt on 16/11/14.
//  Copyright © 2016年 lt. All rights reserved.
//

#import "CALayer+MaskLayer.h"

@implementation CALayer (MaskLayer)

+ (CALayer *)createMaskLayerWithSize:(CGSize)size maskPNGImage:(UIImage *)image
{
    CALayer *layer = [CALayer layer];
    layer.anchorPoint = CGPointMake(0, 0);            //充值锚点
    layer.bounds = CGRectMake(0, 0, size.width, size.height);
    
    if (image)
    {
        layer.contents = (__bridge id)(image.CGImage);
    }
    return layer;
}

@end
