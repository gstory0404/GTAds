part of 'gtads_bqt.dart';

/// @Author: gstory
/// @CreateDate: 2022/10/11 11:40
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述

class GTAdsBqtProvider extends GTAdsProvider {
  GTAdsBqtProvider(String alias, String? androidId, String? iosId)
      : super(alias, androidId, iosId);

  @override
  Future<bool> initAd(bool isDebug) {
    return Baiduad.register(
      //百青藤广告 Android appid 必填
      androidAppId: androidId ?? "",
      //百青藤广告 ios appid 必填
      iosAppId: iosId ?? "",
      //是否打印日志 发布时改为false
      debug: isDebug,
    );
  }

  ///
  /// # 隐私敏感权限API&限制个性化广告推荐
  ///
  /// [readDeviceID] 读取设备ID的权限（建议授权）
  ///
  /// [appList] 读取已安装应用列表权限（建议授权）
  ///
  /// [location] 读取粗略地理位置权限
  ///
  /// [storage] 读写外部存储权限
  ///
  /// [personalAds] 设置限制个性化广告推荐
  ///
  /// [bDPermission] ios 新标志能力，该能力默认开启，如果有监管或隐私要求，在app内配置是否开启该能力。
  ///
  void privacy({
    bool readDeviceID = false,
    bool appList = false,
    bool location = false,
    bool storage = false,
    bool personalAds = false,
    bool bDPermission = false,
  }) {
    Baiduad.privacy(
      readDeviceID: readDeviceID,
      appList: appList,
      location: location,
      storage: storage,
      personalAds: personalAds,
      bDPermission: bDPermission,
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
    StreamSubscription stream = BaiduAdStream.initAdStream(
        //激励广告结果监听
        baiduAdRewardCallBack: BaiduAdRewardCallBack(
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
      onSkip: () {},
      onReady: () async {
        //展示激励广告
        await Baiduad.showRewardVideoAd();
      },
      onUnReady: () {
        if (callBack?.onFail != null) {
          callBack?.onFail!(adCode, "激励广告预加载未准备就绪");
        }
      },
      onVerify: (verify, rewardName, rewardAmount) {
        if (callBack?.onVerify != null) {
          callBack?.onVerify!(adCode, verify, "", rewardName, rewardAmount);
        }
      },
    ));
    Baiduad.loadRewardAd(
      //android广告id
      androidId: adCode.androidId ?? "",
      //ios广告id
      iosId: adCode.iosId ?? "",
      //支持动态设置APPSID，该信息可从移动联盟获得
      appSid: "",
      //用户id
      userId: userId,
      //奖励
      rewardName: rewardName,
      //奖励数
      rewardAmount: rewardAmount,
      //扩展参数 服务器验证使用
      customData: customData,
      //是否使用SurfaceView
      useSurfaceView: false,
      //设置点击跳过时是否展示提示弹框
      isShowDialog: true,
      //设置是否展示奖励领取倒计时提示
      useRewardCountdown: true,
    );
    return stream;
  }

  @override
  StreamSubscription? insertAd(
      GTAdsCode adCode, bool isFull, GTAdsCallBack? callBack) {
    StreamSubscription stream = BaiduAdStream.initAdStream(
        baiduAdInteractionCallBack: BaiduAdInteractionCallBack(
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
      onShow: () {
        if (callBack?.onShow != null) {
          callBack?.onShow!(adCode);
        }
      },
      onReady: () async {
        //展示广告
        await Baiduad.showInterstitialAd();
      },
      onUnReady: () {
        if (callBack?.onFail != null) {
          callBack?.onFail!(adCode, "未加载完成");
        }
      },
    ));
    Baiduad.loadInterstitialAd(
      //android广告位id
      androidId: adCode.androidId ?? "",
      //ios广告位id
      iosId: adCode.iosId ?? "",
    );
    return stream;
  }

  @override
  Widget? splashAd(
      GTAdsCode adCode, double width, double height, GTAdsCallBack? callBack) {
    return BaiduSplashAdView(
      //android广告位id
      androidId: adCode.androidId ?? "",
      //ios广告位id
      iosId: adCode.iosId ?? "",
      //超时时间
      timeout: 4000,
      //宽
      width: width,
      //高
      height: height,
      //广告回调
      callBack: BaiduAdSplashCallBack(
        onShow: () {
          print("开屏广告展示le ");
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
      ),
    );
  }

  @override
  Widget? nativeAd(
      GTAdsCode adCode, double width, double height, GTAdsCallBack? callBack) {
    //信息流广告(优选模版)
    return BaiduNativeAdView(
      //android广告位id
      androidId: adCode.androidId ?? "",
      //ios广告位id
      iosId: adCode.iosId ?? "",
      //广告宽 推荐您将Banner的宽高比固定为20：3以获得最佳的广告展示效果
      width: width,
      //广告高 加载完成后会自动修改为sdk返回广告高
      height: height,
      //广告回调
      callBack: BaiduAdNativeCallBack(onShow: () {
        if (callBack?.onShow != null) {
          callBack?.onShow!(adCode);
        }
      }, onClick: () {
        if (callBack?.onClick != null) {
          callBack?.onClick!(adCode);
        }
      }, onFail: (message) {
        if (callBack?.onFail != null) {
          callBack?.onFail!(adCode, message);
        }
      }, onClose: () {
        if (callBack?.onClose != null) {
          callBack?.onClose!(adCode);
        }
      }),
    );
  }

  @override
  Widget? bannerAd(
      GTAdsCode adCode, double width, double height, GTAdsCallBack? callBack) {
    return null;
  }
}
