# GTAds自定义广告

## GTAdsProvider
新建自己的广告provider继承GTAdsProvider
```dart
class MYAdProvider extends GTAdsProvider{

  MYAdProvider(
      {required String alias,
       String？ androidId,
       String？ iosId})
      : super(alias, androidId, iosId); 

  @override
  Future<bool> initAd(bool isDebug) {
    // TODO: 调用广告初始化，返回是否成功
    throw UnimplementedError();
  }

  @override
  Widget? bannerAd(GTAdsCode adCode, double width, double height, GTAdsCallBack? callBack) {
    // TODO: 返回一个横幅广告Widget
    throw UnimplementedError();
  }

  @override
  Future<bool> insertAd(GTAdsCode adCode, bool isFull, double? width, double? height, GTAdsCallBack? callBack) {
    // TODO: 调用插屏广告方法
     //TODO: 如果使用了StreamSubscription来监听广告回调则 需要在广告结束/失败时进行释放操作
    throw UnimplementedError();
  }

  @override
  Widget? nativeAd(GTAdsCode adCode, double width, double height, GTAdsCallBack? callBack) {
    // TODO: 返回一个信息流广告Widget
    throw UnimplementedError();
  }

  @override
  Future<bool> rewardAd(GTAdsCode adCode, String rewardName, int rewardAmount, String userId, String customData, GTAdsCallBack? callBack) {
   // TODO: 调用激励广告方法
     //TODO: 如果使用了StreamSubscription来监听广告回调则 需要在广告结束/失败时进行释放操作
    throw UnimplementedError();
  }

  @override
  Widget? splashAd(GTAdsCode adCode, double width, double height, GTAdsCallBack? callBack) {
  // TODO: 返回一个开屏广告Widget
    throw UnimplementedError();
  }
  
}
```

## 扩展参数
```
String myParam1;
String? _prama2;

MYAdProvider(
      this.myParam1,
      {required String alias,
      String？ androidId,
      String？ iosId})
      :
      _prama2 = param2,
       super(alias, probability, adsCode);
```

## 扩展方法
可以通过GTAds.getProvider("别名")获取到Provider，则可以使用provider来调用Provider中自定义的方法。

## 扩展回调
GTAdsCallBack提供一个GTAExpand扩展回调接口，可以通过传入不同参数来实现不用参数回传
```
//发送
var map = {
              "type": "onRewardArrived",
              "rewardVerify": rewardVerify,
              "rewardType": rewardType,
              "rewardAmount": rewardAmount,
              "rewardName": rewardName,
              "errorCode": errorCode,
              "error": error,
              "propose": propose,
            };
callBack?.onExpand!(adCode, map);
//接收
GTAdsCallBack(
    onExpand: (code,param){
         print("广告自定义参数 ${code} $param");
    }
)
```
