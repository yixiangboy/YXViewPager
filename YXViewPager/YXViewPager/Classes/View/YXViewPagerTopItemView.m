//
//  YXViewPagerTopItemView.m
//  Pods
//
//  Created by yixiang on 17/3/29.
//
//

#import "YXViewPagerTopItemView.h"
#import "YXViewPagerUtility.h"

static CGFloat const kIconSize = 25.f;
static CGFloat const kTitleSize = 11;
static NSString *const kNormalTitleColor = @"#666666";
static NSString *const kSelectTitleColor = @"#3d3d3d";
static NSString *const kNormalIconName = @"ic_element_tabbar_home_normal";
static NSString *const kSelectIconName = @"ic_element_tabbar_home_pressed";

@interface YXViewPagerTopItemView()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel     *titleLabel;
@property (nonatomic, strong) YXViewPagerItemViewModel *viewModel;
@property (nonatomic, copy)   YXViewPagerTopItemViewSelectCallBack selectCallBack;

@end

@implementation YXViewPagerTopItemView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _iconView = [[UIImageView alloc] init];
        [self addSubview:_iconView];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:kTitleSize];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemClicked)];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:gesture];
        
    }
    return self;
}

- (void)renderUIWithViewModel:(YXViewPagerItemViewModel *)viewModel{
    _viewModel = viewModel;
    YXViewPagerItemViewType itemType = viewModel.itemType;
    switch (itemType) {
        case YXViewPagerItemViewTypeForText:
            [self renderTextType:viewModel];
            break;
        case YXViewPagerItemViewTypeForImage:
            [self renderImageType:viewModel];
            break;
        case YXViewPagerItemViewTypeForTextAndImage:
            [self renderTextAndImageType:viewModel];
            break;
        default:
            break;
    }
}

- (void)settingTabSelect:(BOOL)select{
    YXViewPagerItemViewType itemType = _viewModel.itemType;
    switch (itemType) {
        case YXViewPagerItemViewTypeForText:
            if (select) {
                [self settingTitleColor:_viewModel.selectTitleColor];
            }else{
                [self settingTitleColor:_viewModel.normalTitleColor];
            }
            break;
        case YXViewPagerItemViewTypeForImage:
            if (select) {
                [self settingIconType:_viewModel.imageType iconName:_viewModel.selectIconName selected:YES];
            }else{
                [self settingIconType:_viewModel.imageType iconName:_viewModel.normalIconName selected:NO];
            }
            break;
        case YXViewPagerItemViewTypeForTextAndImage:
            if (select) {
                [self settingTitleColor:_viewModel.selectTitleColor];
                [self settingIconType:_viewModel.imageType iconName:_viewModel.selectIconName selected:YES];
            }else{
                [self settingTitleColor:_viewModel.normalTitleColor];
                [self settingIconType:_viewModel.imageType iconName:_viewModel.normalIconName selected:NO];
            }
            break;
        default:
            break;
    }
}

- (void)renderTextType:(YXViewPagerItemViewModel *)viewModel{
    _titleLabel.frame = self.bounds;
    _titleLabel.text = viewModel.title;
    [self settingTitleColor:viewModel.normalTitleColor];
}

- (void)renderImageType:(YXViewPagerItemViewModel *)viewModel{
    _iconView.frame = CGRectMake(self.width/2-kIconSize/2, self.height/2-kIconSize/2, kIconSize, kIconSize);
    [self settingIconType:viewModel.imageType iconName:viewModel.normalIconName selected:NO];
}


- (void)renderTextAndImageType:(YXViewPagerItemViewModel *)viewModel{
    _iconView.frame = CGRectMake(self.width/2-kIconSize/2, 5., kIconSize, kIconSize);
    [self settingIconType:viewModel.imageType iconName:viewModel.normalIconName selected:NO];
    
    _titleLabel.frame = CGRectMake(0, self.height-9.5-kTitleSize, self.width, kTitleSize);
    _titleLabel.text = viewModel.title;
    [self settingTitleColor:viewModel.normalTitleColor];
}


/**
 设置图标
 
 @param iconName
 */
- (void)settingIconType:(TRIPYXViewPagerItemImageType)imageType iconName:(NSString *)iconName selected:(BOOL)selected{
    if (imageType == YXViewPagerItemImageTypeForLocal) {
        if (STRING_IS_BLANK(iconName)) {
            _iconView.image = [UIImage imageLoader:kNormalIconName];
        }else{
            _iconView.image = [UIImage imageLoader:iconName];
        }
    }else if(imageType == YXViewPagerItemImageTypeForUrl){
        if (!STRING_IS_BLANK(iconName)) {
            [self setImageFromUrlWithIconUrl:iconName selected:selected];
        }else{
            if (selected) {
                _iconView.image = [UIImage imageLoader:@"trip_viewpager_item_selected"];
            }else{
                _iconView.image = [UIImage imageLoader:@"trip_viewpager_item_unselected"];
            }
        }
    }
}

//没有网络的情况下，需要默认图。使用placeholder会有闪动感觉
- (void)setImageFromUrlWithIconUrl: (NSString *)iconUrl selected : (BOOL)selected{
    NSURL *iconURL = [NSURL URLWithString:iconUrl];
    if (iconURL) {
        __weak typeof(self) weakSelf = self;
        [_iconView setImageWithURL:[NSURL URLWithString:iconUrl] completed:^(UIImage *image, NSError *error) {
            if (error) {
                if (selected) {
                    weakSelf.iconView.image = [UIImage imageLoader:@"trip_viewpager_item_selected"];
                }else{
                    weakSelf.iconView.image = [UIImage imageLoader:@"trip_viewpager_item_unselected"];
                }
            }
        }];
    }
}


/**
 设置文本颜色
 
 @param titleColor
 */
- (void)settingTitleColor:(NSString *)titleColor{
    if (STRING_IS_BLANK(titleColor)) {
        _titleLabel.textColor = [UIColor colorWithHexString:kNormalTitleColor];
    }else{
        _titleLabel.textColor = [UIColor colorWithHexString:titleColor];
    }
}

- (void)addSelectedCallBack:(YXViewPagerTopItemViewSelectCallBack)callback{
    _selectCallBack = callback;
}

- (void)itemClicked{
    if (_selectCallBack) {
        _selectCallBack(self.tag);
    }
}

@end

