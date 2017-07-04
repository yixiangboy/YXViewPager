//
//  YXViewPagerConfigItemModel.h
//  Pods
//
//  Created by yixiang on 2017/7/4.
//
//

#import <Foundation/Foundation.h>

@interface YXViewPagerConfigItemModel : NSObject

/** 显示模式 0: 文本 1: 图片 2: 图文混排 */
@property (nonatomic, strong) NSNumber *itemType;

/** 标题 */
@property (nonatomic, strong) NSString *title;

/** 未选中标题颜色 */
@property (nonatomic, strong) NSString *normalTitleColor;

/** 选中标题颜色 */
@property (nonatomic, strong) NSString *selectTitleColor;

/** 未选中图标 */
@property (nonatomic, strong) NSString *normalIconName;

/** 选中图标 */
@property (nonatomic, strong) NSString *selectIconName;

/** 图片类型  0: 本地图片  1:网络图片*/
@property (nonatomic, strong) NSNumber *imageType;

/** 该item对应的ViewController的名称 */
@property (nonatomic, strong) NSString *vcName;

@end
