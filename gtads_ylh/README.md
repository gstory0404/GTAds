# GTAds优量汇广告支持插件
<p>
<a href="https://pub.flutter-io.cn/packages/gtads_ylh"><img src=https://img.shields.io/pub/v/gtads_ylh?color=orange></a>
<a href="https://pub.flutter-io.cn/packages/gtads_ylh"><img src=https://img.shields.io/pub/likes/gtads_ylh></a>
<a href="https://pub.flutter-io.cn/packages/gtads_ylh"><img src=https://img.shields.io/pub/points/gtads_ylh></a>
</p>

# 📢 相关插件

- [flutter_tencentad](https://github.com/gstory0404/flutter_tencentad) 腾讯优量汇广告本体，内部已集成无需额外引入，配置相关查看插件说明
- [GTAds](https://github.com/gstory0404/GTAds) 聚合广告插件，必须引入

# 使用

### pubspec.yaml
```dart
 //广告基础库 必须引入
 gtads: ^1.3.0
 //优量汇广告
 gtads_ylh: ^1.3.1
```

### 引入
```dart
import 'package:gtads_ylh/gtads_ylh.dart';
```

### 使用
仅需通过以下方法插入广告至聚合插件，无需关注具体广告的调用
```dart
//别名、androidId、iosId
GTAds.addProvider(GTAdsYlhProvider("ylh", "5098580", "5098580"));
```

> 广告位使用参考[GTAds](https://github.com/gstory0404/GTAds/tree/master/gtads)

