# GTAds穿山甲广告支持插件
<p>
<a href="https://pub.flutter-io.cn/packages/gtads"><img src=https://img.shields.io/badge/gtads_csj-v0.0.3-success></a>
</p>

ð 该插件依托于[GTAds](https://github.com/gstory0404/GTAds),使用前先集成[GTAds](https://github.com/gstory0404/GTAds)。

# 使用

### pubspec.yaml
```dart
 gtads_csj: ^0.0.3
```

### 引入
```dart
import 'package:gtads_csj/gtads_csj.dart';
```

### 使用
```dart
//别名、andoridId、iosId
GTAds.addProvider(GTAdsCsjProvider("csj","5098580","5098580"));
```
