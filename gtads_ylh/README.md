# GTAds优量汇广告支持插件
<p>
<a href="https://pub.flutter-io.cn/packages/gtads"><img src=https://img.shields.io/badge/gtads_ylh-v0.0.2-success></a>
</p>

📢 该插件依托于[GTAds](https://github.com/gstory0404/GTAds)实现,使用前请先集成[GTAds](https://github.com/gstory0404/GTAds)。

# 使用

### pubspec.yaml
```dart
 //广告基础库 必须引入
 gtads: ^0.0.5
 //优量汇广告
 gtads_ylh: ^0.0.2
```

### 引入
```dart
import 'package:gtads_ylh/gtads_ylh.dart';
```

### 使用
仅需通过以下方法插入广告至聚合插件，无需关注具体广告的调用
```dart
//别名、androidId、iosId
GTAds.addProvider([GTAdsYlhProvider("ylh", "5098580", "5098580")]);
```
