# GTAds聚合广告插件
<p>
<a href="https://pub.flutter-io.cn/packages/gtads"><img src=https://img.shields.io/badge/gtads-v0.0.2-success></a>
</p>
GTAds是一款聚合广告管理插件，提供一套广告管理调度方案、本身不提供任何广告，可通过扩展方法插入市面任何一款广告。

# 支持插件
- [gtads_csj(穿山甲广告)](https://github.com/gstory0404/GTAds/tree/master/gtads_csj)

# 自定义广告

# 使用

### pubspec.yaml
```dart
 gtads: ^0.0.0
```

### 引入
```dart
import 'package:gtads/gtads.dart';
```

### 添加广告
广告初始化前必须完成添加
```dart
GTAds.addProvider(GTAdsCsjProvider(
        alias: "csj",
        probability: 6,
        adsCode: GTAdsCode(
          appId: "5098580",
          bannerIds: ["945410197", "945410197"],
          splashIds: ["887367774"],
          nativeIds: ["945417699"],
          insertIds: ["946201351"],
          rewardIds: ["945418088"],
        )));
```
GTAdsCsjProviderc参数
alias 广告别名，必须保证唯一，后续广告加载回调将返回这个别名 识别是哪家的广告
probability广告出现的评率 [0-10] 0不出现 10概率最高
GTAdsCode 广告相关id，android传入android相关，反之则传入ios相关。广告id支持传入多个，在使用时随机使用

### 初始化
```dart
//isDebug 是否开启debug日志
await GTAds.init(isDebug: true);
//return [{csj: true}]，添加的广告初始化结果
```
### 横幅广告
```dart
GTAds.bannerAd(
    //宽
    width: 300,
    //高
    height: 400,
    //回调
    callBack: GTAdsCallBack(
        onShow: (alias, codeId) {
          print("Banner显示 厂商：$alias 广告ID:$codeId");
        }, onClick: (alias, codeId) {
          print("Banner点击 厂商：$alias 广告ID:$codeId");
        }, onFail: (alias, codeId, message) {
          print("Banner错误 厂商：$alias 广告ID:$codeId 错误信息:$message");
        }, onClose: (alias, codeId) {
          print("Banner关闭 厂商：$alias 广告ID:$codeId");
}))
```

### 激励广告
```dart
var b = await GTAds.rewardAd(
                      //奖励名称
                      rewardName: "100金币",
                      //奖励数量
                      rewardAmount: 100,
                      //用户id
                      userId: "user100",
                      //扩展参数
                      customData: "123",
                      callBack: GTAdsCallBack(
                        onShow: (alias, codeId) {
                          print("激励广告显示 $alias  $codeId");
                        },
                        onFail: (alias, codeId, message) {
                          print("激励广告失败 $alias  $codeId $message");
                        },
                        onClick: (alias, codeId) {
                          print("激励广告点击 $alias  $codeId");
                        },
                        onClose: (alias, codeId) {
                          print("激励广告关闭 $alias  $codeId");
                        },
                        onVerify: (alias, codeId, verify, transId, rewardName,
                            rewardAmount) {
                          print(
                              "激励广告关闭 $alias  $codeId $verify $transId $rewardName $rewardAmount");
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
                        isFull: false,
                        width: 300,
                        height: 500,
                        callBack: GTAdsCallBack(
                          onShow: (alias, codeId) {
                            print("插屏广告显示 $alias  $codeId");
                          },
                          onFail: (alias, codeId, message) {
                            print("插屏广告失败 $alias  $codeId $message");
                          },
                          onClick: (alias, codeId) {
                            print("插屏广告点击 $alias  $codeId");
                          },
                          onClose: (alias, codeId) {
                            print("插屏广告关闭 $alias  $codeId");
                          },
                        ));
                    if (b) {
                      print("插屏广告开始请求");
                    }
```

### 开屏广告
```dart
GTAds.splashAd(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        callBack: GTAdsCallBack(
          onShow: (alias, codeId) {
            print("开屏显示 厂商：$alias 广告ID:$codeId");
          },
          onClick: (alias, codeId) {
            print("开屏点击 厂商：$alias 广告ID:$codeId");
          },
          onFail: (alias, codeId, message) {
            print("开屏错误 厂商：$alias 广告ID:$codeId 错误信息:$message");
            Navigator.pop(context);
          },
          onClose: (alias, codeId) {
            print("开屏关闭 厂商：$alias 广告ID:$codeId");
            Navigator.pop(context);
          },
        ),
```

### 信息流
```dart
GTAds.nativeAd(
              width: 300,
              height: 200,
              callBack: GTAdsCallBack(
                onShow: (alias, codeId) {
                  print("信息流显示 厂商：$alias 广告ID:$codeId");
                },
                onClick: (alias, codeId) {
                  print("信息流点击 厂商：$alias 广告ID:$codeId");
                },
                onFail: (alias, codeId, message) {
                  print("信息流错误 厂商：$alias 广告ID:$codeId 错误信息:$message");
                },
                onClose: (alias, codeId) {
                  print("信息流关闭 厂商：$alias 广告ID:$codeId");
                },
              ),
```