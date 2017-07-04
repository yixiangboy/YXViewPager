//
//  UIImageView+YX.h
//  Pods
//
//  Created by yixiang on 2017/7/4.
//
//

#import <UIKit/UIKit.h>

@interface UIImageView (YX)

- (void)setImageWithURL: (NSURL *)url completed:(void(^)(UIImage *image, NSError *error))block;

@end
