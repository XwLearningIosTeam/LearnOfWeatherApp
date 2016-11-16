//
//  UpdatingView.m
//  WeatherApp
//
//  Created by lt on 16/10/31.
//  Copyright © 2016年 lt. All rights reserved.
//

#import "UpdatingView.h"

#define UPDATING_HEIGHT 20.f

@interface UpdatingViewStoreValue : NSObject

@property (nonatomic, assign) CGRect startRect;
@property (nonatomic, assign) CGRect midRect;
@property (nonatomic, assign) CGRect endRect;

@end

@implementation UpdatingViewStoreValue

@end

/*--------------------------------------------*/

@interface UpdatingView ()

@property (nonatomic, strong) UILabel *titleLabel;                              /**< 标题 */
@property (nonatomic, strong) UpdatingViewStoreValue *labelStoreValue;          /**< 标题存储值 */

@property (nonatomic, strong) UILabel *failedLabel;                             /**< 失败 */
@property (nonatomic, strong) UpdatingViewStoreValue *failedLabelStoreValue;    /**< 失败存储值 */

@property (nonatomic, strong) SnowView *snow;                                   /**< 下雪 */
@property (nonatomic, strong) UpdatingViewStoreValue *snowStoreVlaue;           /**< 下雪存储值 */

@end

@implementation UpdatingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, Width / 2.f, Width / 2.f + UPDATING_HEIGHT)];
    if (self)
    {
        [self initLabel];
        [self initSnow];
        
        // 关闭用户交互
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)initLabel
{
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, Width / 2.f, Width/2.f, UPDATING_HEIGHT)];
    [self addSubview:self.titleLabel];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont fontWithName:LATO_LIGHT size:18.f];
    self.titleLabel.text = @"丢内楼某.....\n爸爸在刷新 莫急.........";
    self.titleLabel.GCDTimerInterval = @(0.8f);
    self.titleLabel.glowDuration = @(0.7f);
    self.titleLabel.glowLayerOpacity = @(1.f);
    [self.titleLabel createGlowLayerWithColor:[UIColor whiteColor] glowRadius:2.f];
    [self.titleLabel startGlow];
    
    self.labelStoreValue = [UpdatingViewStoreValue new];
    self.labelStoreValue.midRect = self.titleLabel.frame;
    self.titleLabel.x -= 30.f;
    self.labelStoreValue.startRect = self.titleLabel.frame;
    self.titleLabel.x -= 60.f;
    self.labelStoreValue.endRect = self.titleLabel.frame;
    self.titleLabel.frame = self.labelStoreValue.startRect;
    self.titleLabel.alpha = 0.f;
    
    self.failedLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, Width / 2, Width / 2, UPDATING_HEIGHT)];
    [self addSubview:self.failedLabel];
    self.failedLabel.textColor = [UIColor whiteColor];
    self.failedLabel.textAlignment = NSTextAlignmentCenter;
    self.failedLabel.font = [UIFont fontWithName:LATO_LIGHT size:18.f];
    self.failedLabel.text = @"丢内楼某......\n失败啦........";
    self.failedLabel.GCDTimerInterval = @(0.8f);
    self.failedLabel.glowDuration = @(0.7f);
    self.failedLabel.glowLayerOpacity = @(1.f);
    [self.failedLabel createGlowLayerWithColor:[UIColor whiteColor] glowRadius:2.f];
    [self.failedLabel startGlow];
    
    self.failedLabelStoreValue           = [UpdatingViewStoreValue new];
    self.failedLabelStoreValue.midRect   = self.failedLabel.frame;
    self.failedLabel.x                  -= 30.f;
    self.failedLabelStoreValue.startRect = self.failedLabel.frame;
    self.failedLabel.x                  += 60.f;
    self.failedLabelStoreValue.endRect   = self.failedLabel.frame;
    self.failedLabel.frame               = self.failedLabelStoreValue.startRect;
    self.failedLabel.alpha               = 0.f;
}

- (void)initSnow
{
    self.snow = [[SnowView alloc]initWithFrame:CGRectMake(0, 0, Width / 2, Width / 2)];
    [self addSubview:self.snow];
    self.snow.snowImage = [UIImage imageNamed:@"snow"];
    self.snow.birthRate = 20.f;
    self.snow.gravity = 5.f;
    self.snow.snowColor = [UIColor yellowColor];
    self.snow.layer.mask = [CALayer createMaskLayerWithSize:CGSizeMake(Width / 2, Width / 2) maskPNGImage:[UIImage imageNamed:@"alpha"]];
    [self.snow showSnow];
    self.snow.transform = CGAffineTransformMake(1.4, 0, 0, 1.4, 0, 0);
    self.snow.alpha = 0.f;
}

- (void)show
{
    [UIView animateWithDuration:1.f animations:^{
        self.snow.alpha = 1.f;
        self.snow.transform = CGAffineTransformMake(1.f, 0, 0, 1.f, 0, 0);
        self.titleLabel.frame = self.labelStoreValue.midRect;
        self.titleLabel.alpha = 1.f;
    } completion:^(BOOL finished){
        
    }];
}

- (void)hide
{
    [UIView animateWithDuration:0.75f animations:^{
        self.snow.alpha = 0.f;
        self.snow.transform = CGAffineTransformMake(0.7f, 0, 0, 0.7f, 0, 0);
        
        self.titleLabel.frame = self.labelStoreValue.endRect;
        self.titleLabel.alpha = 0.f;
        
        self.failedLabel.frame = self.failedLabelStoreValue.endRect;
        self.failedLabel.alpha = 0.f;
    } completion:^(BOOL finished){
        self.titleLabel.frame = self.labelStoreValue.startRect;
        self.snow.transform = CGAffineTransformMake(1.4, 0, 0, 1.4, 0, 0);
        self.failedLabel.frame = self.failedLabelStoreValue.startRect;
    }];
}

- (void)insertIntoView:(UIView *)view
{
    
}

- (void)showFailed
{
    [UIView animateWithDuration:1.5f animations:^{
        // 隐藏label标签
        self.titleLabel.frame = self.labelStoreValue.endRect;
        self.titleLabel.alpha = 0.f;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:1.f animations:^{
            // 显示failed标签
            self.failedLabel.frame = self.failedLabelStoreValue.midRect;
            self.failedLabel.alpha = 1.f;
        } completion:^(BOOL finished){
            
        }];
    }];
}

@end
