# GTAds穿山甲广告支持插件
<p>
<a href="https://pub.dev/packages/gtads_csj"><img src=https://img.shields.io/pub/v/gtads_csj?color=orange></a>
<a href="https://pub.dev/packages/gtads_csj"><img src=https://img.shields.io/pub/likes/gtads_csj></a>
<a href="https://pub.dev/packages/gtads_csj"><img src=https://img.shields.io/pub/points/gtads_csj></a>
</p>
<p>
<a href="http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=VhD0AZSmzvsD3fu7CeQFkzpBQHMHANb1&authKey=W7JGJ0HKklyhP1jyBvbTF2Dkw0cq4UmhVSx2zXVdIm6n48Xrto%2B7%2B1n9jbkAadyF&noverify=0&group_code=649574038"><img src=https://img.shields.io/badge/flutter%E4%BA%A4%E6%B5%81%E7%BE%A4-649574038-blue></a>
<a href="http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=9I9lyXewEsEnx0f00EOF_9hEcFmG5Bmg&authKey=AJfQ8%2FhOLcoJ0p5B16EITjFav1IIs3UAerZSUsWZfa0evuklgxibHti51AYlZgI3&noverify=0&group_code=769626410"><img src=https://img.shields.io/badge/flutter%E4%BA%A4%E6%B5%81%E7%BE%A42-769626410-blue></a>
<a href="https://qm.qq.com/q/4MSgZuKimc"><img src=https://img.shields.io/badge/flutter%E5%B9%BF%E5%91%8A%E4%BA%A4%E6%B5%81-662186116-blue></a>
</p>

# 📢 相关插件

- [flutter_unionad](https://github.com/gstory0404/flutter_unionad) 穿山甲广告本体，内部已集成无需额外引入，配置相关查看插件说明
- [GTAds](https://github.com/gstory0404/GTAds) 聚合广告插件，必须引入

# 使用

### pubspec.yaml
```dart
 //广告基础库 必须引入
 gtads: ^1.4.0
 //穿山甲广告
 gtads_csj: ^1.4.1
```

### 引入
```dart
import 'package:gtads_csj/gtads_csj.dart';
```

### 使用
仅需通过以下方法插入广告至聚合插件，无需关注具体广告的调用
```dart
//参数依次为 别名、andorid app Id、ios app Id
//appName初始化使用
GTAdsCsjProvider provider = GTAdsCsjProvider("csj", "5098580", "5098580", appName: "unionad");
//聚合开关
//（非GTAds，穿山甲本身的聚合模式,true使用GroMore下的广告位,false使用广告变现下的广告位）
provider.setUseMediation(true);
GTAds.addProvider(provider);
```

> 广告位使用参考[GTAds](https://github.com/gstory0404/GTAds/tree/master/gtads)