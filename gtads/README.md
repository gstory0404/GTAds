# GTAds聚合广告插件

<p>
<a href="https://pub.dev/packages/gtads"><img src=https://img.shields.io/pub/v/gtads?color=orange></a>
<a href="https://pub.dev/packages/gtads"><img src=https://img.shields.io/pub/likes/gtads></a>
<a href="https://pub.dev/packages/gtads"><img src=https://img.shields.io/pub/points/gtads></a>
<a href="https://github.com/gstory0404/gtads/commits"><img src=https://img.shields.io/github/last-commit/gstory0404/gtads></a>
<a href="https://github.com/gstory0404/gtads"><img src=https://img.shields.io/github/stars/gstory0404/gtads></a>
</p>

GTAds是一个Flutter聚合广告管理插件，支持android、ios，提供一套广告管理调度方案及广告规则、本身不提供任何广告，可通过扩展方法快速集成市面任何一款广告。

## 支持插件

- [gtads(基础库)](https://github.com/gstory0404/GTAds/tree/master/gtads)
- [gtads_csj(字节穿山甲广告支持)](https://github.com/gstory0404/GTAds/tree/master/gtads_csj)
- [gtads_ylh(腾讯优量汇广告支持)](https://github.com/gstory0404/GTAds/tree/master/gtads_ylh)
- [gtads_sigmob(Sigmob广告支持)](https://github.com/gstory0404/GTAds/tree/master/gtads_sigmob)
- [gtads_bqt(百度百青藤广告支持)](https://github.com/gstory0404/GTAds/tree/master/gtads_bqt)
- [gtads_ks(快手广告支持)](https://github.com/gstory0404/GTAds/tree/master/gtads_ks)

## 开发环境

```dart
[✓] Flutter (Channel stable, 3.24.5, on macOS 14.6.1 23G93 darwin-x64, locale zh-Hans-CN)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.1)
[✓] Xcode - develop for iOS and macOS (Xcode 16.1)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2022.1)
[✓] Android Studio (version 2022.3)
[✓] IntelliJ IDEA Ultimate Edition (version 2023.2.2)
[✓] VS Code (version 1.95.3)
[✓] Connected device (4 available)
[✓] Network resources
```

# 使用

> 引入1.4.x最新插件

### pubspec.yaml

```dart
 //广告基础库 必须引入
 gtads: ^1.4.0
 //需要使用的广告按需引入,以下可选
 //字节穿山甲广告
 gtads_csj: ^1.4.1
 //腾讯优量汇广告
 gtads_ylh: ^1.4.1
 //sigmob广告
 gtads_sigmob: ^1.4.1
 //百度百青藤广告
 gtads_bqt: ^1.4.1
 //快手广告
 gtads_ks: ^1.4.1
```

> 基础库版本号与广告插件版本号前两位必须保持一致，不然会出现兼容问题

### 引入

```dart
import 'package:gtads/gtads.dart';
```

### 添加广告

广告初始化前必须完成添加对应广告Provider，如：穿山甲

```dart
//添加Provider
GTAds.addProvider(GTAdsCsjProvider("csj","5098580","5098580",appName: "unionad"));
//添加Provider列表
GTAds.addProviders([GTAdsCsjProvider("csj","5098580","5098580",appName: "unionad")]);
//移除Provider
GTAds.removeProvider("csj");
//获取Provider
GTAds.getProvider("csj");
```

> GTAdsCsjProvider 穿山甲广告Provider
> alias: 广告别名，必须保证唯一，后续广告加载回调将返回这个别名 识别是哪家的广告
> androidId: andorid appId
> iosId: ios appId

📢 使用前查看对应广告Provider参数

### 初始化

```dart
//isDebug 是否开启debug日志
await GTAds.init(isDebug: true);
//return [{csj: true}]，添加的广告初始化结果
```

### GTAdsCode

```dart
//别名 需要与GTAds.addProvider传入的Provider别名保持一致 不然无法加载对应广告
String alias = "";
//当前广告位 androidid
String? androidId;
//当前广告位 iosid
String? iosId;
//GTAdsModel.PRIORITY时 当前广告位的优先级数值越大越优先加载（当加载失败后从剩余广告中按数值大小依次重试）
//GTAdsModel.RANDOM时 当前广告位出现的概率必须大于0,如果小于0则不会加载该广告,数值越大出现的概率越高（当加载失败后从剩余广告中重新随机加载）
int probability = 0;
```

### 横幅广告

```dart
 GTAdsBannerWidget(
    //需要的广告位数组
    codes: [GTAdsCode(alias: "csj", probability: 5,androidId: "945410197",iosId: "945410197")],
    //宽
    width: 300,
    //高
    height: 400,
    //超时时间 当广告失败后会依次重试其他广告 直至所有广告均加载失败 设置超时时间可提前取消
    timeout: 5,
    //广告加载模式 [GTAdsModel.RANDOM]优先级模式 [GTAdsModel.RANDOM]随机模式
    //默认随机模式
    model: GTAdsModel.RANDOM,
    //回调
    callBack: GTAdsCallBack(
        onShow: (code) {
          print("Banner显示 ${code.toJson()}");
        },
        onClick: (code) {
          print("Banner点击 ${code.toJson()}");
        },
        onFail: (code,message) {
          print("Banner错误 ${code.toJson()} $message");
        },
        onClose: (code) {
          print("Banner关闭 ${code.toJson()}");
        },
        onTimeout: () {
          print("Banner加载超时");
        },
        onEnd: () {
          print("Banner所有广告位都加载失败");
        },
)),
```

### 激励广告

```dart
  var b = await GTAds.rewardAd(
    //需要的广告位数组
    codes: [GTAdsCode(alias: "csj", probability: 5,androidId: "945418088",iosId: "945418088")],
    //奖励名称
    rewardName: "100金币",
    //奖励数量
    rewardAmount: 100,
    //用户id
    userId: "user100",
    //扩展参数
    customData: "123",
    //超时时间 当广告失败后会依次重试其他广告 直至所有广告均加载失败 设置超时时间可提前取消
    timeout: 5,
    //广告加载模式 [GTAdsModel.RANDOM]优先级模式 [GTAdsModel.RANDOM]随机模式
    //默认随机模式  
    model: GTAdsModel.RANDOM,
    callBack: GTAdsCallBack(
        onShow: (code) {
          print("激励广告显示 ${code.toJson()}");
        }, onFail: (code, message) {
          print("激励广告失败 ${code.toJson()} $message");
        }, onClick: (code) {
          print("激励广告点击 ${code.toJson()}");
        }, onClose: (code) {
          print("激励广告关闭 ${code.toJson()}");
        }, onVerify: (code, verify, transId, rewardName,
        rewardAmount) {
          print(
        "激励广告关闭 ${code.toJson()} $verify $transId $rewardName $rewardAmount");
        }, onExpand: (code, param) {
          print("激励广告自定义参数 ${code.toJson()} $param");
        },
        onTimeout: () {
         print("激励广告加载超时");
        },
        onEnd: () {
          print("激励广告所有广告位都加载失败");
        },
  ),
);
if (b) {
  print("激励广告开始请求");
}else{
  print("激励广告开始请求失败");
}
```

### 插屏广告

```dart
var b = await GTAds.insertAd(
    //需要的广告位组
    codes: [GTAdsCode(alias: "csj", probability: 5,androidId: "946201351",iosId: "946201351")],
    isFull: false,
    width: 300,
    height: 500,
    //超时时间 当广告失败后会依次重试其他广告 直至所有广告均加载失败 设置超时时间可提前取消
    timeout: 5,
    //广告加载模式 [GTAdsModel.PRIORITY]优先级模式 [GTAdsModel.RANDOM]随机模式
    //默认随机模式
    model: GTAdsModel.RANDOM,
    callBack: GTAdsCallBack(
        onShow: (code) {
         print("插屏广告显示 ${code.toJson()}");
        },
        onFail: (code, message) {
         print("插屏广告失败 ${code.toJson()} $message");
        },
        onClick: (code) {
          print("插屏广告点击 ${code.toJson()}");
        },
        onClose: (code) {
          print("插屏广告关闭 ${code.toJson()}");
        },
        onTimeout: () {
          print("插屏广告加载超时");
        },
        onEnd: () {
          print("插屏广告所有广告位都加载失败");
        },
));
```

### 开屏广告

```dart
GTAdsSplashWidget(
    //需要的广告位组
    codes: [GTAdsCode(alias: "csj", probability: 5,androidId: "887367774",iosId: "887367774")],
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    //超时时间 当广告失败后会依次重试其他广告 直至所有广告均加载失败 设置超时时间可提前取消
    timeout: 5,
    //广告加载模式 [GTAdsModel.PRIORITY]优先级模式 [GTAdsModel.RANDOM]随机模式
    //默认随机模式
    model: GTAdsModel.RANDOM,
    callBack: GTAdsCallBack(
        onShow: (code) {
          print("开屏显示 ${code.toJson()}");
        },
        onClick: (code) {
          print("开屏点击 ${code.toJson()}");
        },
        onFail: (code, message) {
          print("开屏错误 ${code.toJson()} $message");
          Navigator.pop(context);
        },
        onClose: (code) {
          print("开屏关闭 ${code.toJson()}");
          Navigator.pop(context);
        },
        onTimeout: () {
          print("开屏加载超时");
          Navigator.pop(context);
        },
        onEnd: () {
          print("开屏所有广告位都加载失败");
          Navigator.pop(context);
        },
  ),
),
```

### 信息流

```dart
GTAdsNativeWidget(
    //需要的广告位组
    codes: [GTAdsCode(alias: "csj", probability: 5,androidId: "945417699",iosId: "945417699")],
    width: 300,
    height: 200,
    //超时时间 当广告失败后会依次重试其他广告 直至所有广告均加载失败 设置超时时间可提前取消
    timeout: 5,
    //广告加载模式 [GTAdsModel.PRIORITY]优先级模式 [GTAdsModel.RANDOM]随机模式 
    //默认随机模式
    model: GTAdsModel.RANDOM,
    callBack: GTAdsCallBack(
        onShow: (code) {
          print("信息流显示 ${code.toJson()}");
        },
        onClick: (code) {
          print("信息流点击 ${code.toJson()}");
        },
        onFail: (code,message) {
          print("信息流错误 ${code.toJson()} $message");
        },
        onClose: (code) {
          print("信息流关闭 ${code.toJson()}");
        },
        onTimeout: () {
          print("信息流加载超时");
        },
        onEnd: () {
          print("信息流所有广告位都加载失败");
        },
    ),
),
```

## 说明

### 广告位codes

如果不需要某个广告 则可以不传入对应的广告位id到数组中

### 广告加载模式

广告加载模式 mode

- GTAdsModel.PRIORITY 优先级模式传入广告位GTAdsCode中probability数值越大越优先加载，如果数值相同则列表中前面的先加载（当加载失败后从剩余广告中按数值大小依次重试）
- GTAdsModel.RANDOM 随机模式
  传入广告位GTAdsCode中probability数值必须大于0,如果小于0则不会加载该广告,数值越大出现的概率越高（当加载失败后从剩余广告中重新随机加载）

#### GTAdsCallBack说明

```dart
  /// [onShow] 广告加载成功
  /// [onFail] 广告加载失败（单广告位）
  /// [onClick] 广告加载点击
  /// [onVerify] 广告验证
  /// [onClose] 广告关闭
  /// [onTimeout] 广告加载超时
  /// [onEnd] 广告加载结束（所有广告均加载失败）
  /// [onExpand] 广告扩展回调
  GTAdsCallBack(
      {this.onShow,
      this.onFail,
      this.onClick,
      this.onFinish,
      this.onVerify,
      this.onClose,
      this.onTimeout,
      this.onEnd,
      this.onExpand});
```
