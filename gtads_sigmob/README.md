# GTAds Sigmob广告支持插件
<p>
<a href="https://pub.flutter-io.cn/packages/gtads_sigmob"><img src=https://img.shields.io/badge/gtads_sigmob-v1.0.0-success></a>
</p>

# 📢 相关插件

- [sigmobad](https://github.com/gstory0404/sigmobad) Sigmob广告本体，内部已集成无需额外引入，配置相关查看插件说明
- [GTAds](https://github.com/gstory0404/GTAds) 聚合广告插件，必须引入

# 使用

### pubspec.yaml
```dart
 //广告基础库 必须引入
 gtads: ^1.0.0
 //Sigmob广告
 gtads_sigmob: ^1.0.0
```

### 引入
```dart
import 'package:gtads_sigmob/gtads_sigmob.dart';
```

### 使用
仅需通过以下方法插入广告至聚合插件，无需关注具体广告的调用
```dart
//参数依次为 别名、andorid app Id、ios app Id
GTAds.addProvider([
    GTAdsSigmobProvider(
    //广告别名 唯一
    alias: _alias,
    //andorid app id
    androidId: '6878',
    //ios app id
    iosId: '6877',
    //andorid app key
    androidAppKey: '8ebc1fd1c27e650c',
    //ios app key
    iosAppKey: 'eccdcdbd9adbd4a7')
]);
```

### 设置userid
```dart
GTAdsSigmobProvider? provider =
        GTAds.getProvider(_alias) as GTAdsSigmobProvider?;
provider?.setUserId("123");
```
