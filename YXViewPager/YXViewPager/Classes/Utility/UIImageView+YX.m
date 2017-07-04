//
//  UIImageView+YX.m
//  Pods
//
//  Created by yixiang on 2017/7/4.
//
//

#import "UIImageView+YX.h"

@implementation UIImageView (YX)

- (void)setImageWithURL:(NSURL *)url completed:(void (^)(UIImage *image, NSError *error))block{
   dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       NSData *data = [NSData dataWithContentsOfURL:url];
       UIImage *image = [UIImage imageWithData:data];
       dispatch_async(dispatch_get_main_queue(), ^{
           if (image) {
               self.image = image;
               block(image,nil);
           }else{
               block(nil,[NSError errorWithDomain:@"image_error" code:-1 userInfo:@{@"info":@"图片下载出错"}]);
           }
       });

   });
}


@end
