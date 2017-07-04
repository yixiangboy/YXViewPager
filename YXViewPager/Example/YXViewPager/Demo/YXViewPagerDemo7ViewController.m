//
//  YXViewPagerDemo7ViewController.m
//  YXViewPager
//
//  Created by yixiang on 17/3/29.
//  Copyright © 2017年 yixiangboy. All rights reserved.
//

#import "YXViewPagerDemo7ViewController.h"

@interface YXViewPagerDemo7ViewController ()

@end

@implementation YXViewPagerDemo7ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Root viewDidLoad");
    self.title = @"rootVC与subVC通信";
    self.rootToSubInfo = @{
                           @"rootInfo":@"我是RootVC传递过来的参数"
                           };
    [self renderUI];
    [self tabItemSelected:0 needAnimation:NO];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"Root viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"Root viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"Root viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"Root viewDidDisappear");
}

- (void)dealloc{
    NSLog(@"Root dealloc");
}

- (NSDictionary *)getPageConfigInfo{
    NSDictionary *configInfo = @{
                                     @"topViewBgColor":@"#FFFFFF",
                                     @"maskColor":@"#FEEDB1",
                                     @"type":@1,
                                     @"itemWidth":@60,
                                     @"maskWidth":@60,
                                     @"items":@[@{
                                                           @"itemType":@2,
                                                           @"title":@"推荐",
                                                           @"normalTitleColor":@"#666666",
                                                           @"selectTitleColor":@"#3d3d3d",
                                                           @"normalIconName":@"home_unselect",
                                                           @"selectIconName":@"home_select",
                                                           @"vcName":@"YXViewPagerSub0ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@2,
                                                           @"title":@"旅行机票",
                                                           @"normalTitleColor":@"#666666",
                                                           @"selectTitleColor":@"#3d3d3d",
                                                           @"normalIconName":@"flight_unselect",
                                                           @"selectIconName":@"flight_select",
                                                           @"vcName":@"YXViewPagerSub1ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@2,
                                                           @"title":@"签证",
                                                           @"normalTitleColor":@"#666666",
                                                           @"selectTitleColor":@"#3d3d3d",
                                                           @"normalIconName":@"visa_unselect",
                                                           @"selectIconName":@"visa_select",
                                                           @"vcName":@"YXViewPagerSub2ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@2,
                                                           @"title":@"酒店",
                                                           @"normalTitleColor":@"#666666",
                                                           @"selectTitleColor":@"#3d3d3d",
                                                           @"normalIconName":@"hotel_unselect",
                                                           @"selectIconName":@"hotel_select",
                                                           @"vcName":@"YXViewPagerSub3ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@2,
                                                           @"title":@"租车包车",
                                                           @"normalTitleColor":@"#666666",
                                                           @"selectTitleColor":@"#3d3d3d",
                                                           @"normalIconName":@"car_unselect",
                                                           @"selectIconName":@"car_select",
                                                           @"vcName":@"YXViewPagerSub4ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@2,
                                                           @"title":@"接送机",
                                                           @"normalTitleColor":@"#666666",
                                                           @"selectTitleColor":@"#3d3d3d",
                                                           @"normalIconName":@"transfer_unselect",
                                                           @"selectIconName":@"transfer_select",
                                                           @"vcName":@"YXViewPagerSub5ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@2,
                                                           @"title":@"WIFI电话卡",
                                                           @"normalTitleColor":@"#666666",
                                                           @"selectTitleColor":@"#3d3d3d",
                                                           @"normalIconName":@"wifi_unselect",
                                                           @"selectIconName":@"wifi_select",
                                                           @"vcName":@"YXViewPagerSub6ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@2,
                                                           @"title":@"门票",
                                                           @"normalTitleColor":@"#666666",
                                                           @"selectTitleColor":@"#3d3d3d",
                                                           @"normalIconName":@"ticket_unselect",
                                                           @"selectIconName":@"ticket_select",
                                                           @"vcName":@"YXViewPagerSub7ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@2,
                                                           @"title":@"当地玩乐",
                                                           @"normalTitleColor":@"#666666",
                                                           @"selectTitleColor":@"#3d3d3d",
                                                           @"normalIconName":@"fun_unselect",
                                                           @"selectIconName":@"fun_select",
                                                           @"vcName":@"YXViewPagerSub8ViewController"
                                                           }
                                                       ]
                                        };
    return configInfo;
}


@end
