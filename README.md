# 一、简述
现在的App也来越关注用户的体验，如果你们需求是做一个让别人轻松逛一逛的界面的话，像这种可以左右滑动切换Tab的多界面交互效果是非常适合的，不需要用户过多的点击，左右滑动的交互效果让体验更加良好。比如手淘首页中“淘抢购”，“有好货”，“男神范”，“必买清单”都是这种交互方式。我们飞猪在做出境超市首页Native化、周边好去处项目、全球第一站项目，也是采取这种交互方式，项目也顺利完成，在交互效果上大家评价都还不错，我花了一点时间，去掉了一些业务代码，对代码重构了一下，提取出了可以开源的部分代码，供大家做一个参考。[项目地址](https://github.com/yixiangboy/YXViewPager)
# 二、可以实现的效果展示
| 效果           | 展示           | 
| ------------- |:-------------:| 
| 图片+文字切换效果<br/> **淘宝有好货**     | <img src="http://upload-images.jianshu.io/upload_images/1595403-d2768a8d7eb159df.gif?imageMogr2/auto-orient/strip" height=250/> |
| 单独文字切换效果<br/> **淘宝有好货**      | <img src="http://upload-images.jianshu.io/upload_images/1595403-815d0a9ae3434587.gif?imageMogr2/auto-orient/strip" height=250/>      |
| 单独图片切换效果<br/> **淘宝有好货** | <img src="http://upload-images.jianshu.io/upload_images/1595403-1744c20c63cb20ac.gif?imageMogr2/auto-orient/strip" height=250/>      |
| 图片+文字选中切换效果<br/> **出境超市**  | <img src="http://upload-images.jianshu.io/upload_images/1595403-ee2f52d368143461.gif?imageMogr2/auto-orient/strip" height=250/>|
|超过一屏时候的切换效果<br/> **出境超市**|<img src="http://upload-images.jianshu.io/upload_images/1595403-ea2939e00290d91e.gif?imageMogr2/auto-orient/strip" height=250/>|
|复杂遮罩切换效果<br/> **全球第一战、周边好去处**| <img src="https://gw.alicdn.com/tfs/TB1hS9xSXXXXXc9XXXXXXXXXXXX-277-521.gif" height=250/>|

# 三、如何使用
* **1、页面主体框架页面需要继承于YXViewPagerBaseViewController。**
* **2、里面每一个tab下面的子页面，需要继承于YXViewPagerBaseSubViewController。**
* **3、在页面主体框架页面中重写- (NSDictionary \*)getPageConfigInfo；方法。**
返回的pageConfig即为本框架的主体内容，可以设置的属性如下

| 属性名称           | 属性效果           | 
| ------------- |:-------------:| 
| topViewBgColor| 背景色|
| maskColor| 第一遮罩颜色|
| maskHeight| 第一遮罩高度 默认和父类一样高|
| maskWidth| 第一遮罩宽度 默认和父类一样宽|
| needSecondaryMask| 是否需要第二遮罩|
| secondaryMaskColor| 第二遮罩颜色|
| secondaryMaskColorAlpha| 第二遮罩层颜色的alpha值|
| maskPositionType| 遮罩位置 0:占据整个高度 1:顶部 2: 顶部|
| type|显示类型  0:总宽度为屏幕宽度，不可滚动，每个item的宽度，根据item的个数确定。适合item数比较少的情况 1:每个item的宽度确定，超过屏幕可以滑动。适合item数比较多的情况|
| itemWidth|每一个item显示的宽度|
| items|每一个items的信息集合|


* 4、**items每一个item可以设置的属性如下：**


| 属性名称           | 属性效果           | 
| ------------- |:-------------:| 
| itemType| 显示模式 0: 文本 1: 图片 2: 图文混排|
| title| 标题|
| normalTitleColor| 未选中标题颜色|
| selectTitleColor| 选中标题颜色|
| normalIconName| 未选中图标|
| selectIconName| 选中图标|
| imageType| 图片类型  0: 本地图片  1:网络图片|
| vcName| 该item对应的ViewController的名称|


* 5、**在合适的实际调用渲染函数**

```
[self renderUI];//渲染主框架
[self tabItemSelected:0 needAnimation:NO];//主框架定位到第几个tab

```

* 6、**主框架把数据传给里面每一个子页面**
在主框架中，重写- (NSDictionary *)rootToSubInfo；返回的数据既可以在子页面中收到。

```
- (NSDictionary *)rootToSubInfo{
NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//添加参数
return dic;
}
```

子页面重写 - (void)setRootToSubInfo:(NSDictionary *)rootToSubInfo方法，rootToSubInfo即为主框架传递过来的信息

```
- (void)setRootToSubInfo:(NSDictionary *)rootToSubInfo{
//在这里处理主框架传递过来的参数信息
}
```

* 7、**子页面把数据传给主框架,其实在渲染主框架的时候，主框架作为代理，传给了子页面。**
我们可以在子页面中调用对应的代理方法即可。

```
[self.delegate handleEventWithEventName:@"jumpOtherType" context:@{@"index":@4}];
```
然后在主框架中实现代理方法即可。

```
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
```

* 8、**默认开启沉浸式titleBar效果**
如果需要关闭，该功能的话，在主框架中，重写- (BOOL)needMagicTitleBar;返回NO即可。

* 9、**默认支持左滑返回事件**


#  四、联系方式
[新浪微博](http://weibo.com/5612984599/info)

[github](https://github.com/yixiangboy)

[简书首页](http://www.jianshu.com/users/c3c893a27097/timeline)

如果感觉有用，star一下吧~ ~。
