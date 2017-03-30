//
//  YXViewPagerSub8ViewController.m
//  YXViewPager
//
//  Created by yixiang on 17/3/29.
//  Copyright © 2017年 yixiangboy. All rights reserved.
//

#import "YXViewPagerSub8ViewController.h"
#import "YXViewPagerSub0ViewController.h"


@interface YXViewPagerSub8ViewController ()


@end

@implementation YXViewPagerSub8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Sub1 viewDidLoad");
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, self.view.width, 50)];
    [btn setTitle:@"点击跳转到其他界面" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 260, self.view.width, 50)];
    [btn2 setTitle:@"点击跳转到其他Type" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(jump2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

- (void)jump{
    [self.rootVc.navigationController pushViewController:[[YXViewPagerSub0ViewController alloc] init] animated:YES];
}

- (void)jump2{
    [self.delegate handleEventWithEventName:@"jumpOtherType" context:@{@"index":@4}];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"Sub1 viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"Sub1 viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"Sub1 viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"Sub1 viewDidDisappear");
}


@end
