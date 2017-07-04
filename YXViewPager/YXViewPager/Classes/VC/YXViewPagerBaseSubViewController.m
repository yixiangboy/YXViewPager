//
//  YXViewPagerBaseSubViewController.m
//  Pods
//
//  Created by yixiang on 17/3/29.
//
//

#import "YXViewPagerBaseSubViewController.h"
#import "YXViewPagerUtility.h"

@interface YXViewPagerBaseSubViewController ()

@end

@implementation YXViewPagerBaseSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, self.view.width, self.view.height-64-YXViewPagerHeight);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y <= 0){
        if ([self.scrollDelegate respondsToSelector:@selector(beginToPullRefresh)]){
            [self.scrollDelegate beginToPullRefresh];
        }
    }else {
        if ([self.scrollDelegate respondsToSelector:@selector(scrollViewDidScrollWithOffset:)]){
            [self.scrollDelegate scrollViewDidScrollWithOffset:scrollView.contentOffset.y];
        }
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if ([self.scrollDelegate respondsToSelector:@selector(scrollViewWillBeginDraggingWithOffset:)]){
        [self.scrollDelegate scrollViewWillBeginDraggingWithOffset:scrollView.contentOffset.y];
    }
}

@end
