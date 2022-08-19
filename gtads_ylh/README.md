# GTAds优量汇广告支持插件
<p>
<a href="https://pub.flutter-io.cn/packages/gtads"><img src=https://img.shields.io/badge/gtads_ylh-v0.0.1-success></a>
</p>

📢 该插件依托于[GTAds](https://github.com/gstory0404/GTAds)实现,使用前请先集成[GTAds](https://github.com/gstory0404/GTAds)。

# 使用

### pubspec.yaml
```dart
 gtads_ylh: ^0.0.1
```

### 引入
```dart
import 'package:gtads_ylh/gtads_ylh.dart';
```

### 使用
```dart
//别名、androidId、iosId
GTAds.addProvider(GTAdsYlhProvider("ylh", "5098580", "5098580"));
```
