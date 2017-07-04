//
//  YXViewPagerConfigModel.h
//  Pods
//
//  Created by yixiang on 2017/7/4.
//
//

#import <Foundation/Foundation.h>
#import "YXViewPagerConfigItemModel.h"

@interface YXViewPagerConfigModel : NSObject

/** 背景色 */
@property (nonatomic, strong) NSString *topViewBgColor;

/** 第一遮罩颜色 */
@property (nonatomic, strong) NSString *maskColor;

/** 第一遮罩高度 默认和父类一样高*/
@property (nonatomic, strong) NSNumber *maskHeight;

/** 第一遮罩宽度 默认和父类一样宽*/
@property (nonatomic, strong) NSNumber *maskWidth;

/** 是否需要第二遮罩 */
@property (nonatomic, strong) NSNumber *needSecondaryMask;

/** 第二遮罩颜色 默认和父类一样宽高 可以继续扩展*/
@property (nonatomic, strong) NSString *secondaryMaskColor;

/** 第二遮罩层颜色的alpha值 */
@property (nonatomic, strong) NSNumber *secondaryMaskColorAlpha;

/** 遮罩位置 0:占据整个高度 1:顶部 2: 顶部 */
@property (nonatomic, strong) NSNumber *maskPositionType;

/** 显示类型  0:总宽度为屏幕宽度，不可滚动，每个item的宽度，根据item的个数确定。适合item数比较少的情况 1:每个item的宽度确定，超过屏幕可以滑动。适合item数比较多的情况 */
@property (nonatomic, strong) NSNumber *type;

/** 每一个item显示的宽度 */
@property (nonatomic, strong) NSNumber *itemWidth;

/** 每一个items的信息集合 */
@property (nonatomic, strong) NSArray<YXViewPagerConfigItemModel *> *items;

@end
