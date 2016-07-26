//
//  ViewController.m
//  九宫格Demo
//
//  Created by 遇见远洋 on 16/7/26.
//  Copyright © 2016年 遇见远洋. All rights reserved.
//

#import "ViewController.h"
#import "ButtonContainerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ButtonContainerView * container = [[ButtonContainerView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:container];
    container.spitlotBlock = ^(UIButton * clickedBtn) {
        NSLog(@"被点击的按钮tag%ld",clickedBtn.tag);
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
