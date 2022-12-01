part of 'gtads_csj.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/16 15:02
/// @Email gstory0404@gmail.com
/// @Description: GTAds穿山甲广告提供

class GTAdsCsjProvider extends GTAdsProvider {
  String appName = "";

  GTAdsCsjProvider(String alias, String? androidId, String? iosId,
      {required this.appName})
      : super(alias, androidId, iosId);

  @override
  Future<bool> initAd(bool isDebug) {
    return FlutterUnionad.register(
        //穿山甲广告 Android appid 必填
        androidAppId: androidId ?? "",
        //穿山甲广告 ios appid 必填
        iosAppId: iosId ?? "",
        //使用TextureView控件播放视频,默认为SurfaceView,当有SurfaceView冲突的场景，可以使用TextureView 选填
        useTextureView: true,
        //appname 必填
        appName: appName,
        //是否允许sdk展示通知栏提示 选填
        allowShowNotify: true,
        //是否在锁屏场景支持展示广告落地页 选填
        allowShowPageWhenScreenLock: true,
        //是否显示debug日志
        debug: isDebug,
        //是否支持多进程，true支持 选填
        supportMultiProcess: true,
        //是否开启个性化推荐 选填 默认开启
        personalise: FlutterUnionadPersonalise.close,
        //允许直接下载的网络状态集合 选填
        directDownloadNetworkType: [
          FlutterUnionadNetCode.NETWORK_STATE_2G,
          FlutterUnionadNetCode.NETWORK_STATE_3G,
          FlutterUnionadNetCode.NETWORK_STATE_4G,
          FlutterUnionadNetCode.NETWORK_STATE_WIFI
        ]);
  }

  @override
  Widget splashAd(
      GTAdsCode adCode, double width, double height, GTAdsCallBack? callBack) {
    return FlutterUnionad.splashAdView(
      //是否使用个性化模版  设定widget宽高
      mIsExpress: true,
      //android 开屏广告广告id 必填
      androidCodeId: adCode.androidId ?? "",
      //ios 开屏广告广告id 必填
      iosCodeId: adCode.iosId ?? "",
      //是否支持 DeepLink 选填
      supportDeepLink: true,
      // 期望view 宽度 dp 选填 mIsExpress=true必填
      expressViewWidth: width,
      //期望view高度 dp 选填 mIsExpress=true必填
      expressViewHeight: height,
      //控制下载APP前是否弹出二次确认弹窗
      downloadType: FlutterUnionadDownLoadType.DOWNLOAD_TYPE_POPUP,
      //用于标注此次的广告请求用途为预加载（当做缓存）还是实时加载，
      adLoadType: FlutterUnionadLoadType.LOAD,
      callBack: FlutterUnionadSplashCallBack(
        onShow: () {
          if (callBack != null && callBack.onShow != null) {
            callBack.onShow!(adCode);
          }
        },
        onClick: () {
          if (callBack != null && callBack.onClick != null) {
            callBack.onClick!(adCode);
          }
        },
        onFail: (error) {
          if (callBack != null && callBack.onFail != null) {
            callBack.onFail!(adCode, error);
          }
        },
        onFinish: () {
          if (callBack != null && callBack.onClose != null) {
            callBack.onClose!(adCode);
          }
        },
        onSkip: () {
          if (callBack != null && callBack.onClose != null) {
            callBack.onClose!(adCode);
          }
        },
        onTimeOut: () {
          if (callBack != null && callBack.onFail != null) {
            callBack.onFail!(adCode, "加载超时");
          }
        },
      ),
    );
  }

  @override
  Widget nativeAd(
      GTAdsCode adCode, double width, double height, GTAdsCallBack? callBack) {
    return //个性化模板信息流广告
        FlutterUnionad.nativeAdView(
      //android 信息流广告id 必填
      androidCodeId: adCode.androidId ?? "",
      //ios banner广告id 必填
      iosCodeId: adCode.iosId ?? "",
      //是否支持 DeepLink 选填
      supportDeepLink: true,
      // 期望view 宽度 dp 必填
      expressViewWidth: width,
      //期望view高度 dp 必填
      expressViewHeight: height,
      mIsExpress: true,
      //控制下载APP前是否弹出二次确认弹窗
      downloadType: FlutterUnionadDownLoadType.DOWNLOAD_TYPE_POPUP,
      //用于标注此次的广告请求用途为预加载（当做缓存）还是实时加载，
      adLoadType: FlutterUnionadLoadType.LOAD,
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
    return FlutterUnionad.bannerAdView(
      //andrrid banner广告id 必填
      androidCodeId: adCode.androidId ?? "",
      //ios banner广告id 必填
      iosCodeId: adCode.iosId ?? "",
      //是否使用个性化模版
      mIsExpress: true,
      //是否支持 DeepLink 选填
      supportDeepLink: true,
      //一次请求广告数量 大于1小于3 必填
      expressAdNum: 1,
      //轮播间隔事件 30-120秒  选填
      expressTime: 30,
      // 期望view 宽度 dp 必填
      expressViewWidth: width,
      //期望view高度 dp 必填
      expressViewHeight: height,
      //控制下载APP前是否弹出二次确认弹窗
      downloadType: FlutterUnionadDownLoadType.DOWNLOAD_TYPE_POPUP,
      //用于标注此次的广告请求用途为预加载（当做缓存）还是实时加载，
      adLoadType: FlutterUnionadLoadType.LOAD,
      //是否启用点击 仅ios生效 默认启用
      isUserInteractionEnabled: true,
      //广告事件回调 选填
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
      //是否支持 DeepLink 选填
      supportDeepLink: true,
      //视屏方向 选填
      orientation: FlutterUnionadOrientation.VERTICAL,
      //控制下载APP前是否弹出二次确认弹窗
      downloadType: FlutterUnionadDownLoadType.DOWNLOAD_TYPE_POPUP,
      //用于标注此次的广告请求用途为预加载（当做缓存）还是实时加载，
      adLoadType: FlutterUnionadLoadType.LOAD,
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
      //ios 激励视频广告id  必填
      supportDeepLink: true,
      //是否支持 DeepLink 选填
      rewardName: rewardName,
      //奖励名称 选填
      rewardAmount: rewardAmount,
      //奖励数量 选填
      userID: userId,
      //  用户id 选填
      orientation: FlutterUnionadOrientation.VERTICAL,
      //控制下载APP前是否弹出二次确认弹窗
      downloadType: FlutterUnionadDownLoadType.DOWNLOAD_TYPE_POPUP,
      //视屏方向 选填
      mediaExtra: customData,
      //扩展参数 选填
      //用于标注此次的广告请求用途为预加载（当做缓存）还是实时加载，
      adLoadType: FlutterUnionadLoadType.PRELOAD,
    );
    return stream;
  }
}
