#开源啦，一个iOS中完全解耦的ViewPager实现。

##一、简述
现在的App也来越关注用户的体验，如果你们需求是做一个让别人轻松逛一逛的界面的话，像这种可以左右滑动切换Tab的多界面交互效果是非常适合的，不需要用户过多的点击，左右滑动的交互效果让体验更加良好。比如手淘首页中“淘抢购”，“有好货”，“男神范”，“必买清单”都是这种交互方式。我们飞猪在做出境超市首页Native化的时候，也是采取这种交互方式，项目也顺利完成，在交互效果上大家评价都还不错，我花了一点时间，去掉了一些业务代码，对代码重构了一下，提取出了可以开源的部分代码，供大家做一个参考。[项目地址](https://github.com/yixiangboy/YXViewPager)。
##二、效果展示
###1.1：图片+文字切换效果
![](http://i1.piimg.com/567571/7f2dcaeaeebfb646.gif)
###1.2：单独文字切换效果
![](http://i2.muimg.com/567571/3f718862163dff08.gif)
###1.3：单独图片切换效果
![](http://i4.buimg.com/567571/48a3a5842683d6c9.gif)
###1.4：图片+文字选中切换效果
![](http://i2.muimg.com/567571/51199717a5f07651.gif)
###1.5：超过一屏时候的切换效果
![](http://i4.buimg.com/567571/ced57d8f20a3a541.gif)

##三、如何使用
###2.1：源码引入
去github下载源码，获取YXViewpager/YXViewPager/Classes/*目录下的所有文件拷贝到自己的工程目录中。
目录结构如下：

```
├── Delegate
│   └── YXViewPagerEventDelegate.h
├── Utility
│   ├── UIColor+YX.h
│   ├── UIColor+YX.m
│   ├── UIView+YX.h
│   ├── UIView+YX.m
│   ├── YXViewPagerDefine.h
│   └── YXViewPagerUtility.h
├── VC
│   ├── YXViewPagerBaseSubViewController.h
│   ├── YXViewPagerBaseSubViewController.m
│   ├── YXViewPagerBaseViewController.h
│   └── YXViewPagerBaseViewController.m
├── View
│   ├── ViewModel
│   │   ├── YXViewPagerItemViewModel.h
│   │   └── YXViewPagerItemViewModel.m
│   ├── YXViewPagerTopItemView.h
│   ├── YXViewPagerTopItemView.m
│   ├── YXViewPagerTopView.h
│   └── YXViewPagerTopView.m
└── YXViewPager.h
```

Delegate：主要处理事件回调

Utility：一些常规帮助类

VC：这两个类是我们业务线需要继承的。主框架ViewController需要继承YXViewPagerBaseViewController，下面每一个子的ViewController需要继承YXViewPagerBaseSubViewController

View:一些自定义View

###2.2：cocoapods引入
pod 'YXViewPager', '~> 0.0.1'
###2.3：使用方式
具体你可以下载github项目中的Example目录，提供了Demo，使用方式非常简单。
这边拿"超过一屏时候的切换效果"作为例子，讲解一下使用这个框架该如何使用。

![](http://i4.buimg.com/567571/ced57d8f20a3a541.gif)

####第一步：新建一个ViewController继承于YXViewPagerBaseViewController。
取名为YXViewPagerDemo4ViewController。

```
- (NSDictionary *)getPageConfigInfo{
    NSDictionary *configInfo = @{
                                        @"topViewBgColor":@"#FFFFFF",
                                        @"maskColor":@"#FEEDB1",
                                        @"type":@1,
                                        @"itemWidth":@60,
                                        @"dataArray":@[@{
                                                           @"itemType":@2,
                                                           @"title":@"推荐",
                                                           @"normalTitleColor":@"#666666",
                                                           @"selectTitleColor":@"#3d3d3d",
                                                           @"normalIconName":@"home_unselect",
                                                           @"selectIconName":@"home_select",
                                                           @"vcName":@"YXViewPagerSub0ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@2,
                                                           @"title":@"旅行机票",
                                                           @"normalTitleColor":@"#666666",
                                                           @"selectTitleColor":@"#3d3d3d",
                                                           @"normalIconName":@"flight_unselect",
                                                           @"selectIconName":@"flight_select",
                                                           @"vcName":@"YXViewPagerSub1ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@2,
                                                           @"title":@"签证",
                                                           @"normalTitleColor":@"#666666",
                                                           @"selectTitleColor":@"#3d3d3d",
                                                           @"normalIconName":@"visa_unselect",
                                                           @"selectIconName":@"visa_select",
                                                           @"vcName":@"YXViewPagerSub2ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@2,
                                                           @"title":@"酒店",
                                                           @"normalTitleColor":@"#666666",
                                                           @"selectTitleColor":@"#3d3d3d",
                                                           @"normalIconName":@"hotel_unselect",
                                                           @"selectIconName":@"hotel_select",
                                                           @"vcName":@"YXViewPagerSub3ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@2,
                                                           @"title":@"租车包车",
                                                           @"normalTitleColor":@"#666666",
                                                           @"selectTitleColor":@"#3d3d3d",
                                                           @"normalIconName":@"car_unselect",
                                                           @"selectIconName":@"car_select",
                                                           @"vcName":@"YXViewPagerSub4ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@2,
                                                           @"title":@"接送机",
                                                           @"normalTitleColor":@"#666666",
                                                           @"selectTitleColor":@"#3d3d3d",
                                                           @"normalIconName":@"transfer_unselect",
                                                           @"selectIconName":@"transfer_select",
                                                           @"vcName":@"YXViewPagerSub5ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@2,
                                                           @"title":@"WIFI电话卡",
                                                           @"normalTitleColor":@"#666666",
                                                           @"selectTitleColor":@"#3d3d3d",
                                                           @"normalIconName":@"wifi_unselect",
                                                           @"selectIconName":@"wifi_select",
                                                           @"vcName":@"YXViewPagerSub6ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@2,
                                                           @"title":@"门票",
                                                           @"normalTitleColor":@"#666666",
                                                           @"selectTitleColor":@"#3d3d3d",
                                                           @"normalIconName":@"ticket_unselect",
                                                           @"selectIconName":@"ticket_select",
                                                           @"vcName":@"YXViewPagerSub7ViewController"
                                                           },
                                                       @{
                                                           @"itemType":@2,
                                                           @"title":@"当地玩乐",
                                                           @"normalTitleColor":@"#666666",
                                                           @"selectTitleColor":@"#3d3d3d",
                                                           @"normalIconName":@"fun_unselect",
                                                           @"selectIconName":@"fun_select",
                                                           @"vcName":@"YXViewPagerSub8ViewController"
                                                           }
                                                       ]
                                        };
    return configInfo;
}
```
重写getPageConfigInfo方法，通过NSDictionary配置项进行初始化。配置项常用字段为。

topViewBgColor : 顶部tabView背景色。

maskColor      : 顶部tabView滑动时候的遮罩颜色。

type           : 0-->正好一个屏幕，每一个item项的宽度根据屏幕自适应，顶部tabView不可以滚动, 1-->一般用于顶部Item项目比较多的情况，item的宽度需要在配置表里设置。

itemWidth      : 当type==1的时候，需要手动设置item的宽度。

dataArray      : 为每一个item里面的配置项。

每一个item里面的配置项有如下：

itemType       : 0--> 文本Item。 1-->图片Item。  2-->文本+图片Item

title          : 文本标题

normalTitleColor : 未选中的文本颜色。

selectTitleColor : 选中时候的文本颜色。

normalIconName   : 未选中时候的图片名字。

selectIconName   : 选中时候的图片名字。

vcName           : 该item绑定ViewController实例名称。

配置项可以本地写死，也可以通过服务端动态下发。需要渲染的时候，可用手动调用[self renderUI];即可。

####第二步：新建每一个Item项目里面vcName对应的ViewController实例，该实例需要继承于YXViewPagerBaseSubViewController。
该基类主要提供了RootVc与SubVc之间的通信机制。

```
@interface YXViewPagerBaseSubViewController : UIViewController

/**
 RootVC向SubVC传递的消息参数
 */
@property (nonatomic, strong) NSDictionary *rootToSubInfo;

//RootVC类作为SubVC类的代理 处理一些需要子类传给父类的消息
@property (nonatomic, weak) id<YXViewPagerEventDelegate> delegate;

//在SubVC类中获取rootVc，主要用于跳转
@property (nonatomic, strong) UIViewController *rootVc;

@end
```

每一个SubVc可以在setRootToSubInfo方法中监听，RootVc传递过来的参数。也可以通过self.delegate 向RootVc发送消息。这样就形成了一个相互传参的管道。self.rootVc表示在SubVc中获取RootVc的实例，我在这里主要处理页面的跳转。

## 四、联系方式
[新浪微博](http://weibo.com/5612984599/info)

[github](https://github.com/yixiangboy)

[简书首页](http://www.jianshu.com/users/c3c893a27097/timeline)

如果感觉有用，star一下吧~ ~。