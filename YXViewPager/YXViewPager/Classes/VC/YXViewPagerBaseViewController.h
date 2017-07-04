//
//  YXViewPagerBaseViewController.h
//  Pods
//
//  Created by yixiang on 17/3/29.
//
//

#import <UIKit/UIKit.h>
@class YXViewPagerScrollView;

@interface YXViewPagerBaseViewController : UIViewController

@property (nonatomic, strong) NSDictionary *rootToSubInfo;

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, strong) YXViewPagerScrollView *contentScroller;

//页面框架容器View，如果需要添加子View的话， 添加到containerView上，不要添加到self.view上
@property (nonatomic, strong) UIView *containerView;

- (NSDictionary *)getPageConfigInfo;


/**
 第一次渲染UI
 */
- (void)renderUI;


/**
 主动触发当前子页面setRootToSubInfo方法
 */
- (void)sendRootToSubInfoToCurrentSubVc;


/**
 清除数据
 */
- (void)clearData;

/**
 更新最新数据重新设置ViewPager
 */
- (void)resetViewPager;


/**
 指定定位到某一个tab
 
 @param index
 */
- (void)tabItemSelected:(NSInteger)index needAnimation:(BOOL)needAnimation;

// 通知子类
- (void)didSelectedItem:(NSInteger)index;

//获取当前子类实例
- (UIViewController*)getCurrentVCInstance;

//是否需要沉浸式titleBar,子类需要重写该方案，决定是否需要该效果，默认开启
- (BOOL)needMagicTitleBar;

@end
