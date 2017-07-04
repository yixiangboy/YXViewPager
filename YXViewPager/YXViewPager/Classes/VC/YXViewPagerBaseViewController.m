//
//  YXViewPagerBaseViewController.m
//  Pods
//
//  Created by yixiang on 17/3/29.
//
//

#import "YXViewPagerBaseViewController.h"
#import "YXViewPagerEventDelegate.h"
#import "YXViewPagerTopView.h"
#import "YXViewPagerItemViewModel.h"
#import "YXViewPagerUtility.h"
#import "YXViewPagerBaseSubViewController.h"
#import "YXViewPagerScrollView.h"
#import "YXViewPagerConfigModel.h"
#import "YXViewPagerItemViewModel.h"

@interface YXViewPagerBaseViewController ()<UIScrollViewDelegate,YXViewPagerEventDelegate,YXViewPagerSubVcScrollDelegate>

@property (nonatomic, strong) YXViewPagerTopView *topView;
@property (nonatomic, strong) NSMutableArray<YXViewPagerItemViewModel *> *dataArray;

/** 结构化之后的页面数据模型 */
@property (nonatomic, strong) YXViewPagerConfigModel *pageConfigModel;

/** statusBarHeight */
@property (nonatomic, assign) CGFloat statusBarHeight;

/** 子View滑动offsetY */
@property (nonatomic,assign) CGFloat tempOffsetY;

/** 滑动子View初始offset */
@property (nonatomic,assign) CGFloat originDragOffset;

/** 上一次tableview的高度 */
@property (nonatomic,assign) CGFloat childTableHeight;

@end

@implementation YXViewPagerBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _containerView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_containerView];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (NSDictionary *)getPageConfigInfo{
    return nil;
}

- (void)renderUI{
    _containerView.backgroundColor = [UIColor colorWithHexString:@"#F2F3F4"];
    [self initViewPagerData];
    [self initTopView];
    [self initContentScroller];
}

- (void)resetViewPager{
    [self clearData];
    [self renderUI];
}

- (void)clearData{
    if(_topView){
        [_topView removeFromSuperview];
    }
    _topView = nil;
    if (_contentScroller) {
        [_contentScroller removeFromSuperview];
    }
    _contentScroller = nil;
    _dataArray = nil;
}

- (void)initViewPagerData{
    NSDictionary *configInfo = [self getPageConfigInfo];
    _pageConfigModel = [self formatConfigInfo:configInfo];
    NSArray *dataArray = _pageConfigModel.items;
    _dataArray = [[NSMutableArray alloc] init];
    for (int i=0; i<dataArray.count; i++) {
        YXViewPagerConfigItemModel *itemInfo = dataArray[i];
        YXViewPagerItemViewModel *viewModel = [[YXViewPagerItemViewModel alloc] init];
        viewModel.itemType = [itemInfo.itemType integerValue];
        viewModel.title = itemInfo.title;
        viewModel.normalTitleColor = itemInfo.normalTitleColor;
        viewModel.selectTitleColor = itemInfo.selectTitleColor;
        viewModel.normalIconName = itemInfo.normalIconName;
        viewModel.selectIconName = itemInfo.selectIconName;
        viewModel.imageType = [itemInfo.imageType integerValue];
        viewModel.vcName = itemInfo.vcName;
        
        [_dataArray addObject:viewModel];
    }
}

- (YXViewPagerConfigModel *)formatConfigInfo : (NSDictionary *)configInfo{
    YXViewPagerConfigModel *configModel = [[YXViewPagerConfigModel alloc] init];
    configModel.topViewBgColor = configInfo[@"topViewBgColor"] ? configInfo[@"topViewBgColor"] : @"#FFFFFF";
    configModel.type = configInfo[@"type"] ? configInfo[@"type"] : @0;
    configModel.itemWidth = configInfo[@"itemWidth"] ? configInfo[@"itemWidth"] : @80;
    configModel.maskColor = configInfo[@"maskColor"] ? configInfo[@"maskColor"] : @"#F3AB2B";
    configModel.maskHeight = configInfo[@"maskHeight"] ? configInfo[@"maskHeight"] : @2;
    configModel.maskWidth = configInfo[@"maskWidth"] ? configInfo[@"maskWidth"] : @80;
    configModel.maskPositionType = configInfo[@"maskPositionType"] ? configInfo[@"maskPositionType"] : @0;
    configModel.needSecondaryMask = configInfo[@"needSecondaryMask"];
    configModel.secondaryMaskColor = configInfo[@"secondaryMaskColor"] ? configInfo[@"secondaryMaskColor"] : @"#FFFFFF";
    configModel.secondaryMaskColorAlpha = configInfo[@"secondaryMaskColorAlpha"] ? configInfo[@"secondaryMaskColorAlpha"] : @1;
    
    
    
    NSArray *items = configInfo[@"items"];
    NSMutableArray<YXViewPagerConfigItemModel *> *itemModels = [[NSMutableArray alloc] init];
    for (int i=0; i<items.count; i++) {
        NSDictionary *itemInfo = items[i];
        YXViewPagerConfigItemModel *itemModel = [[YXViewPagerConfigItemModel alloc] init];
        itemModel.itemType = itemInfo[@"itemType"] ? itemInfo[@"itemType"] : @2;
        itemModel.title = itemInfo[@"title"] ? itemInfo[@"title"] : @"标题";
        itemModel.normalTitleColor = itemInfo[@"normalTitleColor"] ? itemInfo[@"normalTitleColor"] : @"#666666";
        itemModel.selectTitleColor = itemInfo[@"selectTitleColor"] ? itemInfo[@"selectTitleColor"] : @"#F3AB2B";
        itemModel.selectIconName = itemInfo[@"selectIconName"] ? itemInfo[@"selectIconName"] : @"trip_market_home_select";
        itemModel.normalIconName = itemInfo[@"normalIconName"] ? itemInfo[@"normalIconName"] : @"trip_market_home_unselect";
        itemModel.imageType = itemInfo[@"imageType"] ? itemInfo[@"imageType"] : @0;
        itemModel.vcName = itemInfo[@"vcName"] ? itemInfo[@"vcName"] : @"TRIPYXViewPagerSubBaseViewController";
        [itemModels addObject:itemModel];
    }
    configModel.items = itemModels;
    return configModel;
}


/**
 主动触发当前子页面setRootToSubInfo方法
 @param rootToSubInfo
 */
- (void)sendRootToSubInfoToCurrentSubVc{
    YXViewPagerItemViewModel *viewModel = _dataArray[_currentIndex];
    UIViewController *vc = viewModel.vcInstance;
    [vc performSelector:@selector(setRootToSubInfo:) withObject:self.rootToSubInfo];
}

- (UIViewController*)getCurrentVCInstance {
    YXViewPagerItemViewModel *viewModel = _dataArray[_currentIndex];
    return viewModel.vcInstance;
}

/**
  由子类实现
 
 @return
 */
- (NSDictionary *)rootToSubInfo{
    return nil;
}

- (void)initTopView{
    _topView = [[YXViewPagerTopView alloc] initWithFrame:CGRectMake(0, self.navBarHeight, _containerView.width, YXViewPagerHeight)];
    _topView.backgroundColor = [UIColor colorWithHexString:_pageConfigModel.topViewBgColor];
    _topView.maskColor = _pageConfigModel.maskColor;
    
    _topView.maskPositionType = [_pageConfigModel.maskPositionType integerValue];
    _topView.maskHeight = [_pageConfigModel.maskHeight floatValue];
    _topView.maskWidth = [_pageConfigModel.maskWidth floatValue];
    _topView.needSecondaryMask = [_pageConfigModel.needSecondaryMask boolValue];
    _topView.secondaryMaskColor = _pageConfigModel.secondaryMaskColor;
    _topView.secondaryMaskColorAlpha = [_pageConfigModel.secondaryMaskColorAlpha floatValue];
    if ([_pageConfigModel.type integerValue] == YXViewPagerTopViewTypeForCanScroll) {
        _topView.type = [_pageConfigModel.type integerValue];
        _topView.itemWidth = [_pageConfigModel.itemWidth floatValue];
    }
    [_topView renderUIWithArray:_dataArray];
    //    [_topView addScrollViewBlock:^(UIScrollView *scrollView) {
    //    }];
    __weak typeof(self) weakSelf = self;
    [_topView addItemClickBlock:^(NSInteger tag) {
        [weakSelf tabItemSelected:tag];
    }];
    [_containerView addSubview:_topView];
}

- (void)initContentScroller{
    _contentScroller = [[YXViewPagerScrollView alloc] initWithFrame:CGRectMake(0, _topView.bottom, _containerView.width, _containerView.height-_topView.bottom)];
    _contentScroller.pagingEnabled = YES;
    _contentScroller.delegate = self;
    _contentScroller.bounces = NO;
    _contentScroller.showsHorizontalScrollIndicator = NO;
    _contentScroller.contentSize = CGSizeMake(_contentScroller.width*_dataArray.count, _contentScroller.height);
    [_containerView addSubview:_contentScroller];
}


- (void)tabItemSelected:(NSInteger)index needAnimation:(BOOL)needAnimation{
    _childTableHeight = self.contentScroller.height;
    
    _currentIndex = index;
    [_topView tabItemSelected:index];
    [_contentScroller setContentOffset:CGPointMake(index*_contentScroller.width, 0) animated:needAnimation];
    [self loadSubViewController];
    
    [self didSelectedItem:index];
}

-(void)didSelectedItem:(NSInteger)index {
    UIViewController *vc = [self getCurrentVCInstance];
    if (![vc isKindOfClass:[YXViewPagerBaseSubViewController class]]) {
        return;
    }
    YXViewPagerBaseSubViewController *subVc = (YXViewPagerBaseSubViewController*)vc;
    if ([self needMagicTitleBar]) {
        subVc.scrollDelegate = self;
    }
    self.contentScroller.height = _childTableHeight;
    self.contentScroller.contentSize = CGSizeMake(self.contentScroller.contentSize.width, self.contentScroller.height);
    ((YXViewPagerBaseSubViewController*)[self getCurrentVCInstance]).tableView.height = _childTableHeight;
}


- (void)tabItemSelected:(NSInteger)index{
    [self tabItemSelected:index needAnimation:YES];
    
    [self didSelectedItem:index];
}

- (void)loadSubViewController{
    NSLog(@"====yx======%zi",_currentIndex);
    
    YXViewPagerItemViewModel *viewModel = _dataArray[_currentIndex];
    
    BOOL hasShow = viewModel.hasShow;
    if (!hasShow) {
        viewModel.hasShow = YES;
        YXViewPagerBaseSubViewController *vc = [self getSubViewControllerByViewModel:viewModel];
        if (vc) {
            vc.rootToSubInfo = self.rootToSubInfo;
            vc.rootVc = self;
            vc.delegate = self;
            
            UIView *contentView = vc.view;
            contentView.frame = CGRectMake(_currentIndex*_contentScroller.width, 0, _contentScroller.width, _contentScroller.height);
            [_contentScroller addSubview:contentView];
            viewModel.vcInstance = vc;
            [self addChildViewController:vc];
        }
    }else{
        YXViewPagerBaseSubViewController *vc = viewModel.vcInstance;
        vc.rootToSubInfo = self.rootToSubInfo;
    }
}

- (YXViewPagerBaseSubViewController *)getSubViewControllerByViewModel: (YXViewPagerItemViewModel *)viewModel{
    
    NSString *vcName = viewModel.vcName;
    Class vcClass = NSClassFromString(vcName);
    
    if ([vcClass isSubclassOfClass:[YXViewPagerBaseSubViewController class]]) {
        YXViewPagerBaseSubViewController *vc = [[vcClass alloc] init];
        return vc;
    }
    
    return nil;
}

- (void)handleEventWithEventName:(NSString *)eventName context:(NSDictionary *)context{
    NSLog(@"eventName == %@",eventName);
    NSLog(@"content == %@",context);
    if (!STRING_IS_BLANK(eventName)) {
        if ([eventName isEqualToString:@"jumpOtherType"]) {
            NSInteger index = [context[@"index"] integerValue];
            [self tabItemSelected:index];
        }
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //滚动停止的时候才设置item被选中，5.22改，有问题@我 铭道
    CGFloat positionPage = scrollView.contentOffset.x/scrollView.width;
    if (((int)(positionPage*1000))%1000<1) {
        int page = (int)positionPage;//当前滑动到的page
        if (_currentIndex != page) {
            _currentIndex = page;
            [self tabItemSelected:_currentIndex];
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //2、YXCommonUITabsTopViewTypeForNoScroll模式下面 对于maskView的处理
    CGFloat rate = scrollView.contentOffset.x/scrollView.contentSize.width;
    CGFloat tabWidth = _topView.tabScroller.contentSize.width;
    CGFloat itemWidth = _topView.maskView.width;
    UIView *maskView = _topView.maskView;
    NSInteger type = [_pageConfigModel.type integerValue];
    if (type == YXViewPagerTopViewTypeForNoScroll) {
        maskView.frame = CGRectMake(rate*_containerView.width, maskView.top, maskView.width, maskView.height);
    }else if(type == YXViewPagerTopViewTypeForCanScroll){
        CGFloat centerX = tabWidth*rate+itemWidth/2;
        if (centerX>_containerView.width/2 && centerX<tabWidth-_containerView.width/2) {
            _topView.tabScroller.contentOffset = CGPointMake(centerX-_containerView.width/2, 0);
            maskView.frame = CGRectMake(_containerView.width/2-itemWidth/2, maskView.top, maskView.width, maskView.height);
        }
        
        if (centerX <= _containerView.width/2) {
            _topView.tabScroller.contentOffset = CGPointMake(0, 0);
            maskView.frame = CGRectMake(tabWidth*rate, maskView.top, maskView.width, maskView.height);
        }
        
        if (centerX >= tabWidth-_containerView.width/2) {
            _topView.tabScroller.contentOffset = CGPointMake(tabWidth-_containerView.width, 0);
            maskView.frame = CGRectMake(_containerView.width/2+tabWidth*rate-(tabWidth-_containerView.width/2), maskView.top, maskView.width, maskView.height);
        }
    }
}

#pragma mark - scrolldelegate

- (void)scrollViewDidUpOffset:(CGFloat)offset{
    CGFloat offsetDistance = offset * OffsetDistanceV;
    CGFloat scale = offsetDistance/([self navBarHeight] - [UIApplication sharedApplication].statusBarFrame.size.height);
    if (_containerView.top >= 0.0f){
        ((YXViewPagerBaseSubViewController*)[self getCurrentVCInstance]).tableView.height = SCREEN_HEIGHT - [self navBarHeight] - 51;
        [self getCurrentVCInstance].view.height = SCREEN_HEIGHT - [self navBarHeight] - 51;
        return;
    }else{
        CGFloat offsetY = ((YXViewPagerBaseSubViewController*)[self getCurrentVCInstance]).tableView.contentOffset.y;
        
        if (offsetY+[UIScreen mainScreen].bounds.size.height - STATUSBAR_HEIGHT - 51>=((YXViewPagerBaseSubViewController*)[self getCurrentVCInstance]).tableView.contentSize.height) {
            return;
        }
        
        if ((_containerView.top + offsetDistance)>= 0.0f){
            _containerView.origin = CGPointMake(0.0f, 0.0f);
            _containerView.height = [UIScreen mainScreen].bounds.size.height;
            [self getCurrentVCInstance].view.height = SCREEN_HEIGHT - [self navBarHeight] - 51.0f;
            self.contentScroller.height = [self getCurrentVCInstance].view.height;
            self.contentScroller.contentSize = CGSizeMake(self.contentScroller.contentSize.width, self.contentScroller.height);
            ((YXViewPagerBaseSubViewController*)[self getCurrentVCInstance]).tableView.height = [self getCurrentVCInstance].view.height;
            
            for (UIView *view in self.navigationController.navigationBar.subviews){
                view.alpha = 1.0f;
            }
            return;
        }
        
        _containerView.origin = CGPointMake(0.0f, _containerView.top + offsetDistance);
        _containerView.height -= offsetDistance;
        self.contentScroller.height -= offsetDistance;;
        [self getCurrentVCInstance].view.height = self.contentScroller.height;
        self.contentScroller.contentSize = CGSizeMake(self.contentScroller.contentSize.width, self.contentScroller.height);
        ((YXViewPagerBaseSubViewController*)[self getCurrentVCInstance]).tableView.height = self.contentScroller.height;
        
        for (UIView *view in self.navigationController.navigationBar.subviews){
            view.alpha += scale;
        }
    }
}

- (void)scrollViewDidDownOffset:(CGFloat)offset{
    CGFloat offsetDistance = offset * OffsetDistanceV;
    CGFloat scale = offsetDistance/([self navBarHeight] - STATUSBAR_HEIGHT);
    
    if (([self navBarHeight] + _containerView.top) <= STATUSBAR_HEIGHT){
        [self getCurrentVCInstance].view.height = [UIScreen mainScreen].bounds.size.height - STATUSBAR_HEIGHT - 51;
        return;
    }else{
        
        if ((_containerView.top - offsetDistance + [self navBarHeight]) <= STATUSBAR_HEIGHT){
            _containerView.origin = CGPointMake(0.0f,self.statusBarHeight - [self navBarHeight]);
            _containerView.height += ([self navBarHeight] - STATUSBAR_HEIGHT);
            self.contentScroller.height = [UIScreen mainScreen].bounds.size.height - STATUSBAR_HEIGHT - 51;
            [self getCurrentVCInstance].view.height = [UIScreen mainScreen].bounds.size.height - STATUSBAR_HEIGHT - 51;
            self.contentScroller.contentSize = CGSizeMake(self.contentScroller.contentSize.width, self.contentScroller.height);
            ((YXViewPagerBaseSubViewController*)[self getCurrentVCInstance]).tableView.height = self.contentScroller.height;
            for (UIView *view in self.navigationController.navigationBar.subviews){
                view.alpha = 0.0f;
            }
            return;
        }
        
        _containerView.origin = CGPointMake(0.0f, _containerView.top - offsetDistance);
        _containerView.height += offsetDistance;
        
        self.contentScroller.height += offsetDistance;
        [self getCurrentVCInstance].view.height = self.contentScroller.height;
        self.contentScroller.contentSize = CGSizeMake(self.contentScroller.contentSize.width, self.contentScroller.height);
        ((YXViewPagerBaseSubViewController*)[self getCurrentVCInstance]).tableView.height += offsetDistance;
        for (UIView *view in self.navigationController.navigationBar.subviews){
            view.alpha -= scale;
        }
    }
}

- (void)scrollViewDidScrollWithOffset:(CGFloat)offsetY{
    if (offsetY == self.tempOffsetY){
        return;
    }else if (offsetY > self.tempOffsetY){
        if (fabs(offsetY - _originDragOffset) >= scrollThresholdOffsetDown){
            [self scrollViewDidDownOffset:(offsetY - self.tempOffsetY)];
        }
    }else if (offsetY < self.tempOffsetY){
        if (fabs(offsetY - _originDragOffset) >= scrollThresholdOffsetUp){
            [self scrollViewDidUpOffset:(self.tempOffsetY - offsetY)];
        }
    }
    self.tempOffsetY = offsetY;
}

- (void)scrollViewWillBeginDraggingWithOffset:(CGFloat)offsetY{
    _originDragOffset = offsetY;
}

- (void)beginToPullRefresh{
    if (_containerView.origin.y <= 0.0f){
        _containerView.origin = CGPointMake(0.0f, 0.0f);
        _containerView.height = [UIScreen mainScreen].bounds.size.height;
        [self getCurrentVCInstance].view.height = SCREEN_HEIGHT - [self navBarHeight] - 51.0f;
        for (UIView *view in self.navigationController.navigationBar.subviews){
            view.alpha = 1.0f;
        }
    }
}

- (CGFloat)statusBarHeight{
    if (_statusBarHeight <= 0){
        _statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    }
    return _statusBarHeight;
}

- (BOOL)needMagicTitleBar{
    return YES;
}

-(CGFloat)navBarHeight{
    CGFloat height = 0.f;
    height = self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height;
    return height;
}


@end
