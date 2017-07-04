//
//  YXViewPagerTopView.h
//  Pods
//
//  Created by yixiang on 17/3/29.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YXViewPagerTopViewType) {
    YXViewPagerTopViewTypeForNoScroll = 0,//default 总宽度为屏幕宽度，不可滚动，每个item的宽度，根据item的个数确定。适合item数比较少的情况
    YXViewPagerTopViewTypeForCanScroll//每个item的宽度确定，超过屏幕可以滑动。适合item数比较多的情况。
};

typedef NS_ENUM(NSUInteger, YXViewPagerMaskViewPositionType) {
    YXViewPagerMaskViewPositionTypeForNone = 0,//maskView占据整个高度
    YXViewPagerMaskViewPositionTypeForTop,//maskView的位置 顶部
    YXViewPagerMaskViewPositionTypeForBottom//maskView的位置 底部
};

typedef void (^YXViewPagerTopViewScrollViewBlock)(UIScrollView *scrollView);
typedef void (^YXViewPagerTopViewItemClickBlock)(NSInteger tag);

@interface YXViewPagerTopView : UIView


@property (nonatomic, assign) YXViewPagerTopViewType type;//default YXCommonUITabsTopViewTypeForNoScroll
@property (nonatomic, assign) CGFloat itemWidth;//如果type==YXCommonUITabsTopViewTypeForCanScroll，需要指定宽度
@property (nonatomic, strong) NSString *maskColor;//遮罩层的颜色 default@"#FFEEAE"
@property (nonatomic, assign) CGFloat maskHeight;//遮罩层高度 default = topView的高度
@property (nonatomic, assign) CGFloat maskWidth;//遮罩层宽度
@property (nonatomic, assign) BOOL needSecondaryMask;//是否需要第二遮罩
@property (nonatomic, strong) NSString *secondaryMaskColor;//第二遮罩颜色
@property (nonatomic, assign) CGFloat secondaryMaskColorAlpha;//第二遮罩透明度
@property (nonatomic, assign) YXViewPagerMaskViewPositionType maskPositionType;//遮罩的位置

@property (nonatomic, strong) UIScrollView *tabScroller;
@property (nonatomic, strong) UIView *maskView;

- (void)renderUIWithArray : (NSArray *)dataArray;

- (void)tabItemSelected:(NSInteger)index;

- (void)addScrollViewBlock : (YXViewPagerTopViewScrollViewBlock) block;

- (void)addItemClickBlock : (YXViewPagerTopViewItemClickBlock) block;


@end
