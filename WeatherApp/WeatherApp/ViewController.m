//
//  ViewController.m
//  WeatherApp
//
//  Created by lt on 16/10/20.
//  Copyright © 2016年 lt. All rights reserved.
//

#import "ViewController.h"
#import "FadeBlackView.h"
#import "UpdatingView.h"


@interface ViewController ()<UITableViewDelegate,UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) FadeBlackView *fadeBlackView;
@property (nonatomic, strong) UpdatingView *upDatingVeiw;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 变黑
    self.fadeBlackView = [[FadeBlackView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.fadeBlackView];
    
    // loading
    self.upDatingVeiw = [[UpdatingView alloc] initWithFrame:self.view.frame];
    self.upDatingVeiw.center = self.view.center;
    [self.view addSubview:self.upDatingVeiw];
    
    // 进入加载数据动画效果
    [self getLocationAndFadeShow];
}


- (void)getLocationAndFadeShow
{
    // 显示出等待界面
    [self.fadeBlackView show];
    [self.upDatingVeiw show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
