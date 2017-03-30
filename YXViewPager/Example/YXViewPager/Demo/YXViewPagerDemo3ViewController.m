//
//  YXViewPagerDemo3ViewController.m
//  YXViewPager
//
//  Created by yixiang on 17/3/29.
//  Copyright © 2017年 yixiangboy. All rights reserved.
//

#import "YXViewPagerDemo3ViewController.h"

@interface YXViewPagerDemo3ViewController ()

@end

@implementation YXViewPagerDemo3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"只有图片";
    [self renderUI];
}

- (NSDictionary *)getPageConfigInfo{
    NSDictionary *configInfo = @{
                                        @"topViewBgColor":@"282B31",
                                        @"maskColor":@"#269FE7",
                                        @"dataArray":@[@{
                                                           @"itemType":@1,
                                                           @"normalIconName":@"icon_0_normal",
                                                           @"selectIconName":@"icon_0_normal",
                                                           @"vcName":@"YXViewPagerSub0ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@1,
                                                           @"normalIconName":@"icon_1_normal",
                                                           @"selectIconName":@"icon_1_normal",
                                                           @"vcName":@"YXViewPagerSub1ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@1,
                                                           @"normalIconName":@"icon_2_normal",
                                                           @"selectIconName":@"icon_2_normal",
                                                           @"vcName":@"YXViewPagerSub2ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@1,
                                                           @"normalIconName":@"icon_3_normal",
                                                           @"selectIconName":@"icon_3_normal",
                                                           @"vcName":@"YXViewPagerSub3ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@1,
                                                           @"normalIconName":@"icon_4_normal",
                                                           @"selectIconName":@"icon_4_normal",
                                                           @"vcName":@"YXViewPagerSub4ViewController"
                                                           }
                                                       ]
                                        };
    return configInfo;
}

@end
