part of 'gtads_csj.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/16 15:02
/// @Email gstory0404@gmail.com
/// @Description: GTAds穿山甲广告提供

class GTAdsCsjProvider extends GTAdsProvider {
  String appName = "";
  bool? useMediation = true; //穿山甲聚合开关
  AndroidPrivacy? androidPrivacy;
  IOSPrivacy? iosPrivacy;
  String? localConfig;

  GTAdsCsjProvider(String alias, String? androidId, String? iosId,
      {required this.appName,
      this.useMediation,
      String? ohosId,
      this.androidPrivacy,
      this.iosPrivacy,
      this.localConfig})
      : super(alias, androidId, iosId, ohosId: ohosId);

  @override
  Future<bool> initAd(bool isDebug) {
    return FlutterUnionad.register(
      //穿山甲广告 Android appid 必填
      androidAppId: androidId ?? "",
      //穿山甲广告 ios appid 必填
      iosAppId: iosId ?? "",
      //穿山甲广告 ohos appid
      ohosAppId: ohosId ?? "",
      //使用TextureView控件播放视频,默认为SurfaceView,当有SurfaceView冲突的场景，可以使用TextureView 选填
      useTextureView: true,
      useMediation: useMediation,
      //appname 必填
      appName: appName,
      //是否允许sdk展示通知栏提示 选填
      allowShowNotify: true,
      //是否显示debug日志
      debug: isDebug,
      //是否支持多进程，true支持 选填
      supportMultiProcess: true,
      //允许直接下载的网络状态集合 选填
      directDownloadNetworkType: [
        FlutterUnionadNetCode.NETWORK_STATE_2G,
        FlutterUnionadNetCode.NETWORK_STATE_3G,
        FlutterUnionadNetCode.NETWORK_STATE_4G,
        FlutterUnionadNetCode.NETWORK_STATE_WIFI
      ],
      androidPrivacy: androidPrivacy,
      iosPrivacy: iosPrivacy,
      localConfig: localConfig
    );
  }

  @override
  Widget splashAd(
      GTAdsCode adCode, double width, double height, GTAdsCallBack? callBack) {
    return FlutterUnionadSplashAdView(
      //android 开屏广告广告id 必填
      androidCodeId: adCode.androidId ?? "",
      //ios 开屏广告广告id 必填
      iosCodeId: adCode.iosId ?? "",
      // 期望view 宽度 dp 选填
      width: width,
      //期望view高度 dp 选填
      height: height,
      callBack: FlutterUnionadSplashCallBack(onShow: () {
        if (callBack != null && callBack.onShow != null) {
          callBack.onShow!(adCode);
        }
      }, onClick: () {
        if (callBack != null && callBack.onClick != null) {
          callBack.onClick!(adCode);
        }
      }, onFail: (error) {
        if (callBack != null && callBack.onFail != null) {
          callBack.onFail!(adCode, error);
        }
      }, onFinish: () {
        if (callBack != null && callBack.onClose != null) {
          callBack.onClose!(adCode);
        }
      }, onSkip: () {
        if (callBack != null && callBack.onClose != null) {
          callBack.onClose!(adCode);
        }
      }, onTimeOut: () {
        if (callBack != null && callBack.onFail != null) {
          callBack.onFail!(adCode, "加载超时");
        }
      }, onEcpm: (info) {
        print("onEcpm info => $info");
      }),
    );
  }

  @override
  Widget nativeAd(
      GTAdsCode adCode, double width, double height, GTAdsCallBack? callBack) {
    return FlutterUnionadNativeAdView(
      androidCodeId: adCode.androidId ?? "",
      iosCodeId: adCode.iosId ?? "",
      supportDeepLink: true,
      width: width,
      height: height,
      callBack: FlutterUnionadNativeCallBack(
        onShow: () {
          if (callBack != null && callBack.onShow != null) {
            callBack.onShow!(adCode);
          }
        },
        onFail: (error) {
          if (callBack != null && callBack.onFail != null) {
            callBack.onFail!(adCode, error);
          }
        },
        onDislike: (message) {
          if (callBack != null && callBack.onClose != null) {
            callBack.onClose!(adCode);
          }
        },
        onClick: () {
          if (callBack != null && callBack.onClick != null) {
            callBack.onClick!(adCode);
          }
        },
      ),
    );
  }

  @override
  Widget bannerAd(
      GTAdsCode adCode, double width, double height, GTAdsCallBack? callBack) {
    return FlutterUnionadBannerView(
      androidCodeId: adCode.androidId ?? "",
      iosCodeId: adCode.iosId ?? "",
      width: width,
      height: height,
      callBack: FlutterUnionadBannerCallBack(
        onShow: () {
          if (callBack?.onShow != null) {
            callBack?.onShow!(adCode);
          }
        },
        onFail: (error) {
          if (callBack?.onFail != null) {
            callBack?.onFail!(adCode, error);
          }
        },
        onDislike: (message) {
          if (callBack?.onClose != null) {
            callBack?.onClose!(adCode);
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
  StreamSubscription? insertAd(
      GTAdsCode adCode, bool isFull, GTAdsCallBack? callBack) {
    StreamSubscription? stream = null;
    stream = FlutterUnionadStream.initAdStream(
      flutterUnionadNewInteractionCallBack:
          FlutterUnionadNewInteractionCallBack(
        onShow: () {
          if (callBack?.onShow != null) {
            callBack?.onShow!(adCode);
          }
        },
        onSkip: () {},
        onClick: () {
          if (callBack?.onClick != null) {
            callBack?.onClick!(adCode);
          }
        },
        onFinish: () {
          if (callBack?.onFinish != null) {
            callBack?.onFinish!(adCode);
          }
        },
        onFail: (error) {
          if (callBack?.onFail != null) {
            callBack?.onFail!(adCode, error);
          }
        },
        onClose: () {
          if (callBack?.onClose != null) {
            callBack?.onClose!(adCode);
          }
        },
        onReady: () async {
          await FlutterUnionad.showFullScreenVideoAdInteraction();
        },
        onUnReady: () {
          if (callBack?.onFail != null) {
            callBack?.onFail!(adCode, "未加载完成");
          }
        },
      ),
    );
    FlutterUnionad.loadFullScreenVideoAdInteraction(
      //android 全屏广告id 必填
      androidCodeId: adCode.androidId ?? "",
      //ios 全屏广告id 必填
      iosCodeId: adCode.iosId ?? "",
      //ohos 全屏广告id
      ohosCodeId: adCode.ohosId ?? "",
      //视屏方向 选填
      orientation: FlutterUnionadOrientation.VERTICAL,
    );
    return stream;
  }

  @override
  StreamSubscription? rewardAd(
      GTAdsCode adCode,
      String rewardName,
      int rewardAmount,
      String userId,
      String customData,
      GTAdsCallBack? callBack) {
    StreamSubscription? stream = null;
    stream = FlutterUnionadStream.initAdStream(
      flutterUnionadRewardAdCallBack: FlutterUnionadRewardAdCallBack(
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
        onFail: (error) {
          if (callBack?.onFail != null) {
            callBack?.onFail!(adCode, error);
          }
        },
        onClose: () {
          if (callBack?.onClose != null) {
            callBack?.onClose!(adCode);
          }
        },
        onSkip: () {},
        onVerify: (rewardVerify, rewardAmount, rewardName, code, message) {
          if (!rewardVerify) {
            if (callBack?.onFail != null) {
              callBack?.onFail!(adCode, "$code $message");
            }
          }
          if (callBack?.onVerify != null) {
            callBack?.onVerify!(
                adCode, rewardVerify, "", rewardName, rewardAmount);
          }
        },
        onReady: () async {
          //显示激励广告
          await FlutterUnionad.showRewardVideoAd();
        },
        onCache: () async {},
        onUnReady: () {
          if (callBack?.onFail != null) {
            callBack?.onFail!(adCode, "激励广告预加载未准备就绪");
          }
        },
        onRewardArrived: (rewardVerify, rewardType, rewardAmount, rewardName,
            errorCode, error, propose) {
          if (callBack?.onExpand != null) {
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
          }
        },
      ),
    );
    FlutterUnionad.loadRewardVideoAd(
      //是否个性化 选填
      androidCodeId: adCode.androidId ?? "",
      //Android 激励视频广告id  必填
      iosCodeId: adCode.iosId ?? "",
      //ohos 激励视频广告id
      ohosCodeId: adCode.ohosId ?? "",
      //ios 激励视频广告id  必填
      rewardName: rewardName,
      //奖励名称 选填
      rewardAmount: rewardAmount,
      //奖励数量 选填
      userID: userId,
      //  用户id 选填
      orientation: FlutterUnionadOrientation.VERTICAL,
      //视屏方向 选填
      mediaExtra: customData,
      //扩展参数 选填
    );
    return stream;
  }
}
