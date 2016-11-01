//
//  FadeBlackView.m
//  WeatherApp
//
//  Created by lt on 16/10/31.
//  Copyright © 2016年 lt. All rights reserved.
//

#import "FadeBlackView.h"

@implementation FadeBlackView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.f;
    }
    
    return self;
}

- (void)show
{
    [UIView animateWithDuration:1.f animations:^{
        
        self.alpha = 0.75f;
    }];
}

- (void)hide
{
    [UIView animateWithDuration:1.75f animations:^{
        
        self.alpha = 0.f;
    }];
}

@end
