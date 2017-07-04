//
//  YXViewPagerItemViewModel.h
//  Pods
//
//  Created by yixiang on 17/3/29.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class YXViewPagerBaseSubViewController;

typedef NS_ENUM(NSUInteger, YXViewPagerItemViewType) {
    YXViewPagerItemViewTypeForText = 0,
    YXViewPagerItemViewTypeForImage,
    YXViewPagerItemViewTypeForTextAndImage
};

typedef NS_ENUM(NSUInteger, TRIPYXViewPagerItemImageType) {
    YXViewPagerItemImageTypeForLocal = 0,//本地图片
    YXViewPagerItemImageTypeForUrl//网络图片
};

@interface YXViewPagerItemViewModel : NSObject

@property (nonatomic, assign) YXViewPagerItemViewType itemType;
@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *normalTitleColor;//default #666666
@property (nonatomic, strong) NSString *selectTitleColor;//default #3d3d3d

@property (nonatomic, strong) NSString *normalIconName;//defult ic_element_tabbar_home_normal
@property (nonatomic, strong) NSString *selectIconName;//defult ic_element_tabbar_home_pressed

@property (nonatomic, assign) TRIPYXViewPagerItemImageType imageType;//图片类型

@property (nonatomic, assign) BOOL hasShow;//该页面是否已经展示过
@property (nonatomic, strong) NSString *vcName;//vc的名字
@property (nonatomic, strong) YXViewPagerBaseSubViewController *vcInstance;//vc的实例

@end
