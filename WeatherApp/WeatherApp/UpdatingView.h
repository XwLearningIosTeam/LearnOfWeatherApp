//
//  UpdatingView.h
//  WeatherApp
//
//  Created by lt on 16/10/31.
//  Copyright © 2016年 lt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SnowView.h"
#import "UIView+SetRect.h"
#import "AddedFont.h"

@interface UpdatingView : UIView

- (void)insertIntoView:(UIView *)view;

- (void)show;

- (void)hide;

- (void)showFailed;

@end
