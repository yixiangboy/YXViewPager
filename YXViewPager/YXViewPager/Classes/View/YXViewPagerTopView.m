//
//  YXViewPagerTopView.m
//  Pods
//
//  Created by yixiang on 17/3/29.
//
//

#import "YXViewPagerTopView.h"
#import "YXViewPagerUtility.h"
#import "YXViewpagerItemViewModel.h"
#import "YXViewPagerTopItemView.h"

@interface YXViewPagerTopView()<UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *tabViews;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, copy) YXViewPagerTopViewScrollViewBlock scrollViewBlock;
@property (nonatomic, copy) YXViewPagerTopViewItemClickBlock itemClickBlock;
/** maskView显示颜色的Layer */
@property (nonatomic, strong) CALayer *maskLayer;
/** maskView显示颜色的Layer2 */
@property (nonatomic, strong) CALayer *secondaryMaskLayer;

@end

@implementation YXViewPagerTopView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initMaskView];
        [self initTabScroller];
    }
    return self;
}

- (void)initMaskView{
    _maskView = [[UIView alloc] initWithFrame:CGRectZero];
    _maskView.backgroundColor = [UIColor clearColor];
    _secondaryMaskLayer = [CALayer layer];
    _secondaryMaskLayer.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF" alpha:0.1].CGColor;
    [_maskView.layer addSublayer:_secondaryMaskLayer];
    _maskLayer = [CALayer layer];
    _maskLayer.backgroundColor = [UIColor colorWithHexString:@"#FFEEAE"].CGColor;
    [_maskView.layer addSublayer:_maskLayer];
    [self addSubview:_maskView];
}

- (void)initTabScroller{
    _tabScroller = [[UIScrollView alloc] initWithFrame:self.bounds];
    _tabScroller.showsHorizontalScrollIndicator = NO;
    _tabScroller.backgroundColor = [UIColor clearColor];
    _tabScroller.bounces = YES;
    _tabScroller.delegate = self;
    [self addSubview:_tabScroller];
}

- (void)setMaskColor:(NSString *)maskColor{
    _maskColor = maskColor;
    _maskLayer.backgroundColor = [UIColor colorWithHexString:maskColor].CGColor;
}

- (void)renderUIWithArray:(NSArray *)dataArray{
    if (ARRAY_IS_EMPTY(dataArray)) return;
    
    CGFloat offsetX = 0;
    [self handleItemWidthWithItemCount:dataArray.count];
    _maskView.frame = CGRectMake(0, 0, _itemWidth, self.height);
    if (_needSecondaryMask) {
        _secondaryMaskLayer.frame = _maskView.bounds;
        _secondaryMaskLayer.backgroundColor = [UIColor colorWithHexString:_secondaryMaskColor alpha:_secondaryMaskColorAlpha].CGColor;
    }else{
        [_secondaryMaskLayer removeFromSuperlayer];
    }
    
    if (_maskWidth>1) {
        if (_maskPositionType == YXViewPagerMaskViewPositionTypeForNone) {
            _maskLayer.frame = CGRectMake(_maskView.width/2-_maskWidth/2, 0, _maskWidth, _maskView.height);
        }else if(_maskPositionType == YXViewPagerMaskViewPositionTypeForTop) {
            _maskLayer.frame = CGRectMake(0, 0, _itemWidth, _maskHeight);
        }else if(_maskPositionType == YXViewPagerMaskViewPositionTypeForBottom) {
            _maskLayer.frame = CGRectMake(0, self.height-_maskHeight, _itemWidth, _maskHeight);
        }
    }
    _tabViews = [[NSMutableArray alloc] init];
    for (int i=0; i<dataArray.count; i++) {
        YXViewPagerItemViewModel *model = dataArray[i];
        YXViewPagerTopItemView *itemView = [[YXViewPagerTopItemView alloc] initWithFrame:CGRectMake(offsetX, 0, _itemWidth, self.height)];
        [itemView renderUIWithViewModel:model];
        itemView.tag = i;
        [_tabScroller addSubview:itemView];
        offsetX += _itemWidth;
        
        [_tabViews addObject:itemView];
        
        __weak typeof(self) weakSelf = self;
        [itemView addSelectedCallBack:^(NSInteger tag) {
            if (weakSelf.itemClickBlock) {
                weakSelf.itemClickBlock(tag);
            }
        }];
    }
    _tabScroller.contentSize = CGSizeMake(dataArray.count*_itemWidth, self.height);
}

- (void)handleItemWidthWithItemCount:(NSInteger)count{
    if (_type == YXViewPagerTopViewTypeForNoScroll) {
        _itemWidth = self.width/count;
    }else if(_type == YXViewPagerTopViewTypeForCanScroll){
        if (_itemWidth<1) {//如果在canScroll的模式下面,没有设置itemWidth，默认和noScroll一样处理
            _itemWidth = self.width/count;
        }
    }
}

- (void)tabItemSelected:(NSInteger)index{
    _currentIndex = index;
    for (int i=0; i<_tabViews.count; i++) {
        YXViewPagerTopItemView *tabView = _tabViews[i];
        if (i == index) {
            [tabView settingTabSelect:YES];
        }else{
            [tabView settingTabSelect:NO];
        }
    }
}

- (void)addScrollViewBlock:(YXViewPagerTopViewScrollViewBlock)block{
    _scrollViewBlock = block;
}

- (void)addItemClickBlock : (YXViewPagerTopViewItemClickBlock) block{
    _itemClickBlock = block;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat itemWidth = _itemWidth;
    CGFloat offsetX = scrollView.contentOffset.x;
    _maskView.frame = CGRectMake(_currentIndex*itemWidth-offsetX, _maskView.top, _maskView.width, _maskView.height);
    if (_scrollViewBlock) {
        _scrollViewBlock(scrollView);
    }
}


@end
