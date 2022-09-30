part of 'gtads.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/16 10:27
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述 

abstract class GTAdsProvider {

  String _alias;
  String? androidId;
  String? iosId;

  ///
  /// [_alias] 唯一， 广告别名 与广告位GTAdsCode 中别名保持一致 不然无法加载广告
  ///
  /// [androidId] android app id
  ///
  /// [iosId] ios app id
  GTAdsProvider(this._alias, this.androidId, this.iosId);

  ///初始化广告
  ///
  /// [code] 广告相关id
  Future<bool> initAd(bool isDebug);

  ///横幅广告
  ///
  /// [adCode] 广告相关id
  ///
  /// [width] 广告宽
  ///
  /// [height] 广告高
  ///
  /// [callBack] 广告回调
  ///
  ///如果广告不提供 则
  ///  return null;
  Widget? bannerAd(GTAdsCode adCode, double width, double height,
      GTAdsCallBack? callBack);

  ///信息流广告
  ///
  /// [adCode] 广告相关id
  ///
  /// [width] 广告宽
  ///
  /// [height] 广告高
  ///
  /// [callBack] 广告回调
  ///
  ///如果广告不提供 则
  ///   return null;
  Widget? nativeAd(GTAdsCode adCode, double width, double height,
      GTAdsCallBack? callBack);

  ///开屏广告
  ///
  /// [adCode] 广告相关id
  ///
  /// [width] 广告宽
  ///
  /// [height] 广告高
  ///
  /// [callBack] 广告回调
  ///
  ///如果广告不提供 则
  ///   return null;
  Widget? splashAd(GTAdsCode adCode, double width, double height,
      GTAdsCallBack? callBack);

  ///插屏广告
  ///注意： 返回StreamSubscription 插屏广告监听
  ///如果广告不提供 则
  ///   return null;
  StreamSubscription? insertAd(GTAdsCode adCode, bool isFull, GTAdsCallBack? callBack);

  ///激励广告
  ///注意： 返回StreamSubscription 激励广告监听
  ///如果广告不提供 则
  ///   return null;
  StreamSubscription? rewardAd(GTAdsCode adCode, String rewardName, int rewardAmount,
      String userId, String customData, GTAdsCallBack? callBack);

  String getAlias() {
    return this._alias;
  }
}


