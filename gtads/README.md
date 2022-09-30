# GTAds聚合广告插件

<p>
<a href="https://pub.flutter-io.cn/packages/gtads"><img src=https://img.shields.io/badge/gtads-v0.0.6-success></a>
</p>

GTAds是一个Flutter聚合广告管理插件，支持android、ios，提供一套广告管理调度方案及广告规则、本身不提供任何广告，可通过扩展方法快速集成市面任何一款广告。

## 支持插件

- [gtads_csj(穿山甲广告支持)](https://github.com/gstory0404/GTAds/tree/master/gtads_csj)
- [gtads_ylh(优量汇广告支持)](https://github.com/gstory0404/GTAds/tree/master/gtads_ylh)
- [gtads_sigmob(Sigmob广告支持)](https://github.com/gstory0404/GTAds/tree/master/gtads_sigmob)

## 开发环境

```dart
[✓] Flutter (Channel stable, 3.3.0, on macOS 12.5.1 21G83 darwin-x64, locale zh-Hans-CN)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.0-rc1)
[✓] Xcode - develop for iOS and macOS (Xcode 13.4.1)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2021.2)
[✓] IntelliJ IDEA Ultimate Edition (version 2022.1.1)
[✓] VS Code (version 1.70.2)
[✓] Connected device (3 available)
[✓] HTTP Host Availability
```

# 使用

### pubspec.yaml

```dart
 //广告基础库 必须引入
 gtads: ^0.0.6
 //需要使用的广告按需引入,以下可选
 //穿山甲广告
 gtads_csj: ^0.0.10
 //优量汇广告
 gtads_ylh: ^0.0.4
 //优量汇广告
 gtads_sigmob: ^0.0.1
```

### 引入

```dart
import 'package:gtads/gtads.dart';
```

### 添加广告

广告初始化前必须完成添加对应广告Provider，如：穿山甲

```dart
GTAds.addProvider([GTAdsCsjProvider("csj","5098580","5098580")]);
```

GTAdsCsjProviderc参数
alias: 广告别名，必须保证唯一，后续广告加载回调将返回这个别名 识别是哪家的广告
androidId: andorid appId
iosId: ios appId

### 初始化

```dart
//isDebug 是否开启debug日志
await GTAds.init(isDebug: true);
//return [{csj: true}]，添加的广告初始化结果
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
        }),
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
    ),
),
```

## 说明

### 广告位codes

如果不需要某个广告 则可以不传入对应的广告位id到数组中

### GTAdsCode

```dart
//别名 需要与GTAds.addProvider传入的Provider别名保持一致 不然无法加载对应广告
String alias = "";
//当前广告位 androidid
String? androidId;
//当前广告位 iosid
String? iosId;
//当前广告位出现的概率 必须大于0,如果小于0则不会加载该广告
int probability = 0;
```
