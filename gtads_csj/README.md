# GTAds穿山甲广告支持插件

# 使用

### pubspec.yaml
```dart
 gtads_csj: ^0.0.1
```

### 引入
```dart
import 'package:gtads_csj/gtads_csj.dart';
```

### 使用
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