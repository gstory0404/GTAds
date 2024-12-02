# GTAds百度百青藤广告支持插件

> 横幅广告暂不可用

<p>
<a href="https://pub.dev/packages/gtads_bqt"><img src=https://img.shields.io/pub/v/gtads_bqt?color=orange></a>
<a href="https://pub.dev/packages/gtads_bqt"><img src=https://img.shields.io/pub/likes/gtads_bqt></a>
<a href="https://pub.dev/packages/gtads_bqt"><img src=https://img.shields.io/pub/points/gtads_bqt></a>
</p>

<p>
<a href="http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=VhD0AZSmzvsD3fu7CeQFkzpBQHMHANb1&authKey=W7JGJ0HKklyhP1jyBvbTF2Dkw0cq4UmhVSx2zXVdIm6n48Xrto%2B7%2B1n9jbkAadyF&noverify=0&group_code=649574038"><img src=https://img.shields.io/badge/flutter%E4%BA%A4%E6%B5%81%E7%BE%A4-649574038-blue></a>
<a href="http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=9I9lyXewEsEnx0f00EOF_9hEcFmG5Bmg&authKey=AJfQ8%2FhOLcoJ0p5B16EITjFav1IIs3UAerZSUsWZfa0evuklgxibHti51AYlZgI3&noverify=0&group_code=769626410"><img src=https://img.shields.io/badge/flutter%E4%BA%A4%E6%B5%81%E7%BE%A42-769626410-blue></a>
<a href="https://qm.qq.com/q/4MSgZuKimc"><img src=https://img.shields.io/badge/flutter%E6%8F%92%E4%BB%B6%E5%8F%8D%E9%A6%88-662186116-blue></a>
</p>

# 📢 相关插件

- [baiduad](https://github.com/gstory0404/baiduad) 百青藤广告本体，内部已集成无需额外引入，配置相关查看插件说明
- [GTAds](https://github.com/gstory0404/GTAds) 聚合广告插件基础库，必须引入

# 使用

### pubspec.yaml

```dart
 //广告基础库 必须引入
 gtads: ^1.4.0
 //百青藤广告支持
 gtads_bqt: ^1.4.1
```

### 引入

```dart
import 'package:gtads_csj/gtads_bqt.dart';
```

### 使用

仅需通过以下方法插入广告至聚合插件，无需关注具体广告的调用

```dart
//参数依次为 别名、andorid app Id、ios app Id
 GTAds.addProvider(GTAdsBqtProvider("bqt", "b423d90d", "a6b7fed6"));
```

> 广告位使用参考[GTAds](https://github.com/gstory0404/GTAds/tree/master/gtads)
