//
//  SnowView.m
//  WeatherApp
//
//  Created by lt on 16/10/31.
//  Copyright © 2016年 lt. All rights reserved.
//

#import "SnowView.h"

@implementation SnowView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.emitterLayer.emitterShape = kCAEmitterLayerLine;             /**< 直线粒子发射器 发射形状 */
    self.emitterLayer.emitterMode = kCAEmitterLayerSurface;           /**< 发射模式 位置 */
    self.emitterLayer.emitterSize = self.frame.size;                  /**< 发射区域 */
    self.emitterLayer.emitterPosition = CGPointMake(self.bounds.size.width / 2.f, - 5);   /**< 发射中心位置 */
}

- (void)showSnow
{
    if (_snowImage == nil)
    {
        return;
    }
    
    // 创建雪花类型的粒子
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    
    // 粒子的名字
    snowflake.name = @"snow";
    
    // 粒子参数的速度乘数因子
    snowflake.birthRate = _birthRate > 0 ?_birthRate : 1.f;
    
    // 粒子生命周期
    snowflake.lifetime = _lifeTime > 0 ? _lifeTime : 60;
    
    // 粒子速度
    snowflake.velocity = _speed > 0 ? _speed : 10.f;
    
    // 粒子的速度范围
    snowflake.velocityRange = _speedRange > 0 ? _speedRange : 10.f;
    
    // 粒子y方向的加速度分量（可以理解为重力）
    snowflake.yAcceleration = _gravity != 0 ? _gravity : 2.f;
    
    // 每个发射的例子的初始时候随机的角度
    snowflake.emissionRange = 1.5 * M_PI;
    
    // 粒子旋转角度
    snowflake.spinRange = 1.25 * M_PI;
    
    // 获取图片
    snowflake.contents = (id)_snowImage.CGImage;
    
    // 设置雪花形状的例子的颜色
    snowflake.color = _snowColor == nil ? [[UIColor whiteColor] CGColor] : _snowColor.CGColor;
    
    // 尺寸
    snowflake.scale = 0.5f;
    
    // 尺寸变化范围
    snowflake.scaleRange = 0.3f;
    
    // 添加粒子
    self.emitterLayer.emitterCells = @[snowflake];
}

- (void)configType:(EMitterType)type
{
    if (type == __SNOW)
    {
        // 配置
        self.birthRate = 5.f;
        self.snowImage = [UIImage imageNamed:@"snow"];
        self.snowColor = [UIColor blackColor];
        self.lifeTime = 30.f;
        self.alpha = 0.f;
        
        UIImageView *snowAlpha = [[UIImageView alloc] initWithFrame:self.bounds];
        snowAlpha.image = [UIImage imageNamed:@"alpha"];
        self.maskView = snowAlpha;
    }
}

- (void)show
{
    [self showSnow];
    [UIView animateWithDuration:1.75f animations:^{
        self.alpha = 0.5f;
    }];
}

- (void)hide
{
    [UIView animateWithDuration:0.75f animations:^{
        self.alpha = 0.f;
    }completion:^(BOOL finished){
        
    }];
}

@end
