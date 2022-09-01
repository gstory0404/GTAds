part of 'gtads_sigmob.dart';

/// @Author: gstory
/// @CreateDate: 2022/9/1 11:04
/// @Email gstory0404@gmail.com
/// @Description: GTAds Sigmob广告提供

class GTAdsSigmobProvider extends GTAdsProvider {
  final String? androidAppKey;
  final String? iosAppKey;

  String _userId = "";

  GTAdsSigmobProvider(
      {required String alias,
      required String? androidId,
      required String? iosId,
      this.androidAppKey,
      this.iosAppKey})
      : super(alias, androidId, iosId);

  void setUserId(String id) {
    _userId = id;
  }

  @override
  Future<bool> initAd(bool isDebug) {
    return SigmobAd.register(
      //androidId
      androidId: androidId ?? "",
      //iosId
      iosId: iosId ?? "",
      //androidAppKey
      androidAppKey: androidAppKey ?? "",
      //iosAppKey
      iosAppKey: iosAppKey ?? "",
      //是否显示日志log
      debug: isDebug,
      //是否显示个性化推荐广告
      personalized: true,
    );
  }

  @override
  StreamSubscription? rewardAd(
      GTAdsCode adCode,
      String rewardName,
      int rewardAmount,
      String userId,
      String customData,
      GTAdsCallBack? callBack) {
    StreamSubscription? stream;
    stream = SigmobAdStream.initAdStream(
      //激励广告
      rewardCallBack: SigmobAdRewardCallBack(
        onShow: () {
          if (callBack?.onShow != null) {
            callBack?.onShow!(adCode);
          }
        },
        onClick: () {
          if (callBack?.onClick != null) {
            callBack?.onClick!(adCode);
          }
        },
        onFail: (message) {
          if (callBack?.onFail != null) {
            callBack?.onFail!(adCode, message);
          }
        },
        onClose: () {
          if (callBack?.onClose != null) {
            callBack?.onClose!(adCode);
          }
        },
        onReady: () async {
          await SigmobAd.showRewardAd();
        },
        onUnReady: () {
          if (callBack?.onFail != null) {
            callBack?.onFail!(adCode, "激励广告预加载未准备就绪");
          }
        },
        onVerify: (hasReward, rewardName, rewardAmount) {
          if (callBack?.onVerify != null) {
            callBack?.onVerify!(
                adCode, hasReward, "", rewardName, rewardAmount);
          }
        },
      ),
    );
    SigmobAd.loadRewardAd(
      //android广告id
      androidId: adCode.androidId ?? "",
      //ios广告id
      iosId: adCode.iosId ?? "",
      //用户id
      userId: userId,
      //奖励
      rewardName: rewardName,
      //奖励数
      rewardAmount: rewardAmount,
      //扩展参数 服务器回调使用
      customData: customData,
    );
    return stream;
  }

  @override
  StreamSubscription? insertAd(
      GTAdsCode adCode, bool isFull, GTAdsCallBack? callBack) {
    StreamSubscription stream = SigmobAdStream.initAdStream(
      interstitialCallBack: SigmobAdInterstitialCallBack(
        onShow: () {
          if (callBack?.onShow != null) {
            callBack?.onShow!(adCode);
          }
        },
        onClick: () {
          if (callBack?.onClick != null) {
            callBack?.onClick!(adCode);
          }
        },
        onFail: (message) {
          if (callBack?.onFail != null) {
            callBack?.onFail!(adCode, message);
          }
        },
        onClose: () {
          if (callBack?.onClose != null) {
            callBack?.onClose!(adCode);
          }
        },
        onReady: () async {
          await SigmobAd.showInterstitialAd();
        },
        onUnReady: () {
          if (callBack?.onFail != null) {
            callBack?.onFail!(adCode, "插屏广告预加载未准备就绪");
          }
        },
      ),
    );
    SigmobAd.loadInterstitialAd(
      //android广告id
      androidId: adCode.androidId ?? "",
      //ios广告id
      iosId: adCode.iosId ?? "",
      //用户id
      userId: _userId,
    );
    return stream;
  }

  @override
  Widget? splashAd(
      GTAdsCode adCode, double width, double height, GTAdsCallBack? callBack) {
    return SigmobAdSplashWidget(
      //android广告位id
      androidId: adCode.androidId ?? "",
      //ios广告位id
      iosId: adCode.iosId ?? "",
      //宽
      width: width,
      //高
      height: height,
      //超时时间
      fetchDelay: 5,
      //用户id
      userId: _userId,
      callBack: SigmobAdSplashCallBack(
        onShow: () {
          if (callBack?.onShow != null) {
            callBack?.onShow!(adCode);
          }
        },
        onClose: () {
          if (callBack?.onClose != null) {
            callBack?.onClose!(adCode);
          }
        },
        onFail: (message) {
          if (callBack?.onFail != null) {
            callBack?.onFail!(adCode, message);
          }
        },
        onClick: () {
          if (callBack?.onClick != null) {
            callBack?.onClick!(adCode);
          }
        },
      ),
    );
  }

  @override
  Widget? nativeAd(
      GTAdsCode adCode, double width, double height, GTAdsCallBack? callBack) {
    return SigmobAdNativeWidget(
      //andorid广告位id
      androidId: adCode.androidId ?? "",
      //ios广告位id
      iosId: adCode.iosId ?? "",
      //广告宽
      width: width,
      //广告高 加载成功后会自动修改为sdk返回广告高
      height: height,
      //用户id
      userId: _userId,
      //广告回调
      callBack: SigmobAdNativeCallBack(
        onShow: () {
          print("执行了1");
          if (callBack?.onShow != null) {
            callBack?.onShow!(adCode);
          }
        },
        onClose: () {
          if (callBack?.onClose != null) {
            callBack?.onClose!(adCode);
          }
        },
        onFail: (message) {
          if (callBack?.onFail != null) {
            callBack?.onFail!(adCode, message);
          }
        },
        onClick: () {
          if (callBack?.onClick != null) {
            callBack?.onClick!(adCode);
          }
        },
      ),
    );
  }

  @override
  Widget? bannerAd(
      GTAdsCode adCode, double width, double height, GTAdsCallBack? callBack) {
    return null;
  }
}
