# GTAds聚合广告插件
<p>
<a href="https://pub.flutter-io.cn/packages/gtads"><img src=https://img.shields.io/badge/gtads-v0.0.3-success></a>
</p>

# 使用

### pubspec.yaml
```dart
 gtads: ^0.0.3
```

### 引入
```dart
import 'package:gtads/gtads.dart';
```

### 添加广告
广告初始化前必须完成添加
```dart
GTAds.addProvider(GTAdsCsjProvider(alias: "csj",androidId: "5098580",iosId: "5098580"));
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
 GTAds.bannerAd(
    //需要的广告位数组
    codes: [GTAdsCode(alias: "csj", probability: 5,androidId: "945410197",iosId: "945410197")],
    //宽
    width: 300,
    //高
    height: 400,
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
GTAds.splashAd(
    //需要的广告位组
    codes: [GTAdsCode(alias: "csj", probability: 5,androidId: "887367774",iosId: "887367774")],
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
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
GTAds.nativeAd(
    //需要的广告位组
    codes: [GTAdsCode(alias: "csj", probability: 5,androidId: "945417699",iosId: "945417699")],
    width: 300,
    height: 200,
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
//当前广告位出现的概率 必须大于0
int probability = 0;
```
