# GTAds Sigmob广告支持插件
<p>
<a href="https://pub.dev/packages/gtads_sigmob"><img src=https://img.shields.io/pub/v/gtads_sigmob?color=orange></a>
<a href="https://pub.dev/packages/gtads_sigmob"><img src=https://img.shields.io/pub/likes/gtads_sigmob></a>
<a href="https://pub.dev/packages/gtads_sigmob"><img src=https://img.shields.io/pub/points/gtads_sigmob></a>
<a href="https://github.com/gstory0404/gtads/commits"><img src=https://img.shields.io/github/last-commit/gstory0404/gtads></a>
<a href="https://github.com/gstory0404/gtads"><img src=https://img.shields.io/github/stars/gstory0404/gtads></a>
</p>

<p>
<a href="http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=VhD0AZSmzvsD3fu7CeQFkzpBQHMHANb1&authKey=W7JGJ0HKklyhP1jyBvbTF2Dkw0cq4UmhVSx2zXVdIm6n48Xrto%2B7%2B1n9jbkAadyF&noverify=0&group_code=649574038"><img src=https://img.shields.io/badge/flutter%E4%BA%A4%E6%B5%81%E7%BE%A4-649574038-blue></a>
<a href="http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=9I9lyXewEsEnx0f00EOF_9hEcFmG5Bmg&authKey=AJfQ8%2FhOLcoJ0p5B16EITjFav1IIs3UAerZSUsWZfa0evuklgxibHti51AYlZgI3&noverify=0&group_code=769626410"><img src=https://img.shields.io/badge/flutter%E4%BA%A4%E6%B5%81%E7%BE%A42-769626410-blue></a>
<a href="https://qm.qq.com/q/4MSgZuKimc"><img src=https://img.shields.io/badge/flutter%E6%8F%92%E4%BB%B6%E5%8F%8D%E9%A6%88-662186116-blue></a>
</p>

# 📢 相关插件

- [sigmobad](https://github.com/gstory0404/sigmobad) Sigmob广告本体，内部已集成无需额外引入，配置相关查看插件说明
- [GTAds](https://github.com/gstory0404/GTAds) 聚合广告插件，必须引入

# 使用

### pubspec.yaml
```dart
 //广告基础库 必须引入
 gtads: ^1.4.0
 //Sigmob广告
 gtads_sigmob: ^1.4.1
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
