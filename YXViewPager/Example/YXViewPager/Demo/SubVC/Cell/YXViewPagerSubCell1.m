//
//  YXViewPagerSubCell1.m
//  YXViewPager
//
//  Created by yixiang on 17/3/30.
//  Copyright © 2017年 yixiangboy. All rights reserved.
//

#import "YXViewPagerSubCell1.h"
#import <YXViewPager/YXViewPager.h>

@interface YXViewPagerSubCell1()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleView;
@property (nonatomic, strong) UILabel *detailView;

@end

@implementation YXViewPagerSubCell1

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, self.width-20, self.width-20)];
        _iconView.image = [UIImage imageNamed:@"girl1.jpg"];
        [self addSubview:_iconView];
        
        _titleView = [[UILabel alloc] initWithFrame:CGRectMake(10, _iconView.bottom+2, _iconView.width, 18)];
        _titleView.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
        _titleView.text = @"我是周二珂";
        _titleView.font = [UIFont systemFontOfSize:18];
        _titleView.textColor = [UIColor colorWithHexString:@"#3D3D3D"];
        [self addSubview:_titleView];
        
        _detailView = [[UILabel alloc] initWithFrame:CGRectMake(10, self.height-2-16, _iconView.width, 16)];
        _detailView.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
        _detailView.text = @"告白气球";
        _detailView.font = [UIFont systemFontOfSize:16];
        _detailView.textColor = [UIColor colorWithHexString:@"#3D3D3D"];
        [self addSubview:_detailView];
    }
    return self;
}

@end
