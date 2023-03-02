# GTAds快手广告支持插件

<p>
<a href="https://pub.flutter-io.cn/packages/gtads_ks"><img src=https://img.shields.io/pub/v/gtads_ks?color=orange></a>
<a href="https://pub.flutter-io.cn/packages/gtads_ks"><img src=https://img.shields.io/pub/likes/gtads_ks></a>
<a href="https://pub.flutter-io.cn/packages/gtads_ks"><img src=https://img.shields.io/pub/points/gtads_ks></a>
</p>

# 📢 相关插件

- [ksad](https://github.com/gstory0404/ksad) 快手广告本体，内部已集成无需额外引入，配置相关查看插件说明
- [GTAds](https://github.com/gstory0404/GTAds) 聚合广告插件基础库，必须引入

# 使用

### pubspec.yaml

```dart
 //广告基础库 必须引入
 gtads: ^1.2.0
 //快手广告支持
 gtads_ks: ^1.2.1
```

### 引入

```dart
import 'package:gtads_csj/gtads_bqt.dart';
```

### 使用

仅需通过以下方法插入广告至聚合插件，无需关注具体广告的调用

```dart
//参数依次为 别名、andorid app Id、ios app Id
GTAds.addProvider([GTAdsKSProvider(_alias, "613400004", "613400004")]);
```

> 广告位使用参考[GTAds](https://github.com/gstory0404/GTAds/tree/master/gtads)
