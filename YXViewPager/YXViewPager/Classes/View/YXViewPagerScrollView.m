//
//  YXViewPagerScrollView.m
//  Pods
//
//  Created by yixiang on 2017/7/4.
//
//

#import "YXViewPagerScrollView.h"

@implementation YXViewPagerScrollView


/**
 横向ScrollView支持系统左滑返回功能

 @param point
 @param event
 @return
 */
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    int pointIntX = (int)point.x;
    int viewWidth = (int)[UIScreen mainScreen].bounds.size.width;
    if (pointIntX % viewWidth < 10) {
        return NO;
    }
    return [super pointInside:point withEvent:event];
}

@end
