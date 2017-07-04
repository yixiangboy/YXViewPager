//
//  YXViewPagerDemo1ViewController.m
//  YXViewPager
//
//  Created by yixiang on 17/3/29.
//  Copyright © 2017年 yixiangboy. All rights reserved.
//

#import "YXViewPagerDemo1ViewController.h"

@interface YXViewPagerDemo1ViewController ()

@end

@implementation YXViewPagerDemo1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图片+文字";
    NSLog(@"Demo1 viewDidLoad");
    [self renderUI];
    [self tabItemSelected:0 needAnimation:NO];
}

- (void)dealloc{
    
}

- (NSDictionary *)getPageConfigInfo{
    NSDictionary *configInfo = @{
                                        @"topViewBgColor":@"#282B31",
                                        @"maskColor":@"#269FE7",
                                        @"type":@0,
                                        @"items":@[@{
                                                           @"itemType":@2,
                                                           @"title":@"精选",
                                                           @"normalTitleColor":@"#FFFFFF",
                                                           @"selectTitleColor":@"#FFFFFF",
                                                           @"normalIconName":@"icon_0_normal",
                                                           @"selectIconName":@"icon_0_normal",
                                                           @"imageType":@0,
                                                           @"vcName":@"YXViewPagerSub0ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@2,
                                                           @"title":@"百科",
                                                           @"normalTitleColor":@"#FFFFFF",
                                                           @"selectTitleColor":@"#FFFFFF",
                                                           @"normalIconName":@"icon_1_normal",
                                                           @"selectIconName":@"icon_1_normal",\
                                                           @"imageType":@0,
                                                           @"vcName":@"YXViewPagerSub1ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@2,
                                                           @"title":@"种草",
                                                           @"normalTitleColor":@"#FFFFFF",
                                                           @"selectTitleColor":@"#FFFFFF",
                                                           @"normalIconName":@"icon_2_normal",
                                                           @"selectIconName":@"icon_2_normal",
                                                           @"imageType":@0,
                                                           @"vcName":@"YXViewPagerSub2ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@2,
                                                           @"title":@"海淘",
                                                           @"normalTitleColor":@"#FFFFFF",
                                                           @"selectTitleColor":@"#FFFFFF",
                                                           @"normalIconName":@"icon_3_normal",
                                                           @"selectIconName":@"icon_3_normal",
                                                           @"imageType":@0,
                                                           @"vcName":@"YXViewPagerSub3ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@2,
                                                           @"title":@"我说好",
                                                           @"normalTitleColor":@"#FFFFFF",
                                                           @"selectTitleColor":@"#FFFFFF",
                                                           @"normalIconName":@"icon_4_normal",
                                                           @"selectIconName":@"icon_4_normal",
                                                           @"imageType":@0,
                                                           @"vcName":@"YXViewPagerSub4ViewController"
                                                           }
                                                       ]
                                        };
    return configInfo;
}

@end
