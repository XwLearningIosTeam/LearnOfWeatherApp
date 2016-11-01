//
//  EmitterLayerView.m
//  WeatherApp
//
//  Created by lt on 16/10/31.
//  Copyright © 2016年 lt. All rights reserved.
//

#import "EmitterLayerView.h"

@interface EmitterLayerView ()
{
    CAEmitterLayer *_layer;
}

@end

@implementation EmitterLayerView


/**
 替换layer

 @return 替换当前view的layer
 */
+ (Class)layerClass
{
    return [CAEmitterLayer class];
}


/**
 模拟setter，getter方法

 */
- (void)setEmitterLayer:(CAEmitterLayer *)layer
{
    _layer = layer;
}

- (CAEmitterLayer *)emitterLayer
{
    return _layer;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _layer = (CAEmitterLayer *)self.layer;
    }
    return self;
}

- (void)show
{
    
}

- (void)hide
{
    
}

- (void)configType:(EMitterType)type
{
    
}
@end
