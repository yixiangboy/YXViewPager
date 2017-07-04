//
//  YXViewPagerDemo2ViewController.m
//  YXViewPager
//
//  Created by yixiang on 17/3/29.
//  Copyright © 2017年 yixiangboy. All rights reserved.
//

#import "YXViewPagerDemo2ViewController.h"

@interface YXViewPagerDemo2ViewController ()

@end

@implementation YXViewPagerDemo2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"只有文字";
    [self renderUI];
    [self tabItemSelected:0 needAnimation:NO];
}

- (NSDictionary *)getPageConfigInfo{
    NSDictionary *configInfo = @{
                                     @"topViewBgColor":@"#282B31",
                                     @"maskColor":@"#269FE7",
                                     @"type":@0,
                                     @"items":@[@{
                                                           @"itemType":@0,
                                                           @"title":@"精选",
                                                           @"normalTitleColor":@"#FFFFFF",
                                                           @"selectTitleColor":@"#FFFFFF",
                                                           @"vcName":@"YXViewPagerSub0ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@0,
                                                           @"title":@"百科",
                                                           @"normalTitleColor":@"#FFFFFF",
                                                           @"selectTitleColor":@"#FFFFFF",
                                                           @"vcName":@"YXViewPagerSub1ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@0,
                                                           @"title":@"种草",
                                                           @"normalTitleColor":@"#FFFFFF",
                                                           @"selectTitleColor":@"#FFFFFF",
                                                           @"vcName":@"YXViewPagerSub2ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@0,
                                                           @"title":@"海淘",
                                                           @"normalTitleColor":@"#FFFFFF",
                                                           @"selectTitleColor":@"#FFFFFF",
                                                           @"vcName":@"YXViewPagerSub3ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@0,
                                                           @"title":@"我说好",
                                                           @"normalTitleColor":@"#FFFFFF",
                                                           @"selectTitleColor":@"#FFFFFF",
                                                           @"vcName":@"YXViewPagerSub4ViewController"
                                                           }
                                                       ]
                                        };
    return configInfo;
}

@end
