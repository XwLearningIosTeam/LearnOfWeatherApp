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
        
        //关闭用户交互
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
    self.titleLabel.text = @"丢内楼某..............";
    
}

- (void)initSnow
{
    
}

@end
