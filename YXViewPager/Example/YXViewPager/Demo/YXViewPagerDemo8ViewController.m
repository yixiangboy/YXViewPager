//
//  YXViewPagerDemo8ViewController.m
//  YXViewPager
//
//  Created by yixiang on 2017/7/4.
//  Copyright © 2017年 yixiangboy. All rights reserved.
//

#import "YXViewPagerDemo8ViewController.h"

@interface YXViewPagerDemo8ViewController ()

@end

@implementation YXViewPagerDemo8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"复杂遮罩";
    [self renderUI];
    [self tabItemSelected:0 needAnimation:NO];
}

- (NSDictionary *)getPageConfigInfo{
    NSDictionary *configInfo = @{
                                 @"topViewBgColor":@"#2A2A2A",
                                 @"maskColor":@"#FFC900",
                                 @"type":@1,
                                 @"itemWidth":@80,
                                 @"maskHeight":@3,
                                 @"maskPositionType":@2,
                                 @"maskWidth":@80,
                                 @"needSecondaryMask":@(YES),
                                 @"secondaryMaskColor":@"#FFFFFF",
                                 @"secondaryMaskColorAlpha":@(0.09),
                                 @"items":@[@{
                                                @"itemType":@2,
                                                @"title":@"推荐",
                                                @"normalTitleColor":@"#FFFFFF",
                                                @"selectTitleColor":@"#FFC900",
                                                @"imageType":@1,
                                                @"normalIconName":@"https://gw.alicdn.com/tfs/TB1ocN8RXXXXXbNXVXXXXXXXXXX-48-48.png",
                                                @"selectIconName":@"https://gw.alicdn.com/tfs/TB1iNJZRXXXXXa8aXXXXXXXXXXX-48-48.png",
                                                @"vcName":@"YXViewPagerSub0ViewController"
                                                },
                                            @{
                                                @"itemType":@2,
                                                @"title":@"轻奢假日",
                                                @"normalTitleColor":@"#FFFFFF",
                                                @"selectTitleColor":@"#FFC900",
                                                @"imageType":@1,
                                                @"normalIconName":@"https://gw.alicdn.com/tfs/TB1jFqnRXXXXXaNXpXXXXXXXXXX-48-48.png",
                                                @"selectIconName":@"https://gw.alicdn.com/tfs/TB1E.5iRXXXXXauXFXXXXXXXXXX-48-48.png",
                                                @"vcName":@"YXViewPagerSub1ViewController"
                                                },
                                            @{
                                                @"itemType":@2,
                                                @"title":@"走近自然",
                                                @"normalTitleColor":@"#FFFFFF",
                                                @"selectTitleColor":@"#FFC900",
                                                @"imageType":@1,
                                                @"normalIconName":@"https://gw.alicdn.com/tfs/TB12HCERXXXXXagXXXXXXXXXXXX-48-48.png",
                                                @"selectIconName":@"https://gw.alicdn.com/tfs/TB1c5hYRXXXXXbOaXXXXXXXXXXX-48-48.png",
                                                @"vcName":@"YXViewPagerSub2ViewController"
                                                },
                                            @{
                                                @"itemType":@2,
                                                @"title":@"酒店控",
                                                @"normalTitleColor":@"#FFFFFF",
                                                @"selectTitleColor":@"#FFC900",
                                                @"imageType":@1,
                                                @"normalIconName":@"https://gw.alicdn.com/tfs/TB1gpOARXXXXXcmXXXXXXXXXXXX-48-48.png",
                                                @"selectIconName":@"https://gw.alicdn.com/tfs/TB11aqeRXXXXXcaXFXXXXXXXXXX-48-48.png",
                                                @"vcName":@"YXViewPagerSub3ViewController"
                                                },
                                            @{
                                                @"itemType":@2,
                                                @"title":@"家庭亲子",
                                                @"normalTitleColor":@"#FFFFFF",
                                                @"selectTitleColor":@"#FFC900",
                                                @"imageType":@1,
                                                @"normalIconName":@"https://gw.alicdn.com/tfs/TB1IwioRXXXXXXtXVXXXXXXXXXX-48-48.png",
                                                @"selectIconName":@"https://gw.alicdn.com/tfs/TB12mCyRXXXXXctXFXXXXXXXXXX-48-48.png",
                                                @"vcName":@"YXViewPagerSub4ViewController"
                                                },
                                            @{
                                                @"itemType":@2,
                                                @"title":@"文化风情",
                                                @"normalTitleColor":@"#FFFFFF",
                                                @"selectTitleColor":@"#FFC900",
                                                @"imageType":@1,
                                                @"normalIconName":@"https://gw.alicdn.com/tfs/TB1bo0KRXXXXXbdapXXXXXXXXXX-48-48.png",
                                                @"selectIconName":@"https://gw.alicdn.com/tfs/TB1UF9nRXXXXXbzXpXXXXXXXXXX-48-48.png",
                                                @"vcName":@"YXViewPagerSub5ViewController"
                                                },
                                            @{
                                                @"itemType":@2,
                                                @"title":@"周边探索",
                                                @"normalTitleColor":@"#FFFFFF",
                                                @"selectTitleColor":@"#FFC900",
                                                @"imageType":@1,
                                                @"normalIconName":@"https://gw.alicdn.com/tfs/TB15JNMRXXXXXcrapXXXXXXXXXX-48-48.png",
                                                @"selectIconName":@"https://gw.alicdn.com/tfs/TB1_Ox5RXXXXXcCXVXXXXXXXXXX-48-48.png",
                                                @"vcName":@"YXViewPagerSub6ViewController"
                                                }
                                            ]
                                 };
    return configInfo;
}


@end
