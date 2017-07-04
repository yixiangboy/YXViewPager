//
//  YXViewPagerDemo4ViewController.m
//  YXViewPager
//
//  Created by yixiang on 17/3/29.
//  Copyright © 2017年 yixiangboy. All rights reserved.
//

#import "YXViewPagerDemo4ViewController.h"

@interface YXViewPagerDemo4ViewController ()

@end

@implementation YXViewPagerDemo4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图片+文字选中切换";
    [self renderUI];
    [self tabItemSelected:0 needAnimation:NO];
}

- (NSDictionary *)getPageConfigInfo{
    NSDictionary *configInfo = @{
                                        @"topViewBgColor":@"#FFFFFF",
                                        @"maskColor":@"#FEEDB1",
                                        @"type":@0,
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
                                                           }
                                                       ]
                                        };
    return configInfo;
}

@end
