part of 'gtads_csj.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/16 15:02
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述

class GTAdsCsjProvider extends GTAdsProvider {
  ///[alias] 广告别名 注意：保证唯一，不然无法添加
  ///
  ///[probability] 广告出现概率 0 - 10(0不出现)
  ///
  ///[adsCode] 广告id
  GTAdsCsjProvider(
      {required String alias,
      required int probability,
      required GTAdsCode adsCode})
      : super(alias, probability, adsCode);

  @override
  Future<bool> initAd(bool isDebug) {
    return FlutterUnionad.register(
        //穿山甲广告 Android appid 必填
        androidAppId: adsCode.appId,
        //穿山甲广告 ios appid 必填
        iosAppId: adsCode.appId,
        //使用TextureView控件播放视频,默认为SurfaceView,当有SurfaceView冲突的场景，可以使用TextureView 选填
        useTextureView: true,
        //appname 必填
        appName: "unionad_test",
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
      String codeId, double width, double height, GTAdsCallBack? callBack) {
    return FlutterUnionad.splashAdView(
      //是否使用个性化模版  设定widget宽高
      mIsExpress: true,
      //android 开屏广告广告id 必填
      androidCodeId: codeId,
      //ios 开屏广告广告id 必填
      iosCodeId: codeId,
      //是否支持 DeepLink 选填
      supportDeepLink: true,
      // 期望view 宽度 dp 选填 mIsExpress=true必填
      expressViewWidth: 750,
      //期望view高度 dp 选填 mIsExpress=true必填
      expressViewHeight: 800,
      //控制下载APP前是否弹出二次确认弹窗
      downloadType: FlutterUnionadDownLoadType.DOWNLOAD_TYPE_POPUP,
      //用于标注此次的广告请求用途为预加载（当做缓存）还是实时加载，
      adLoadType: FlutterUnionadLoadType.LOAD,
      callBack: FlutterUnionadSplashCallBack(
        onShow: () {
          if (callBack != null && callBack.onShow != null) {
            callBack.onShow!(getAlias(), codeId);
          }
        },
        onClick: () {
          if (callBack != null && callBack.onClick != null) {
            callBack.onClick!(getAlias(), codeId);
          }
        },
        onFail: (error) {
          if (callBack != null && callBack.onFail != null) {
            callBack.onFail!(getAlias(), codeId, error);
          }
        },
        onFinish: () {
          if (callBack != null && callBack.onFinish != null) {
            callBack.onClose!(getAlias(), codeId);
          }
        },
        onSkip: () {},
        onTimeOut: () {},
      ),
    );
  }

  @override
  Widget nativeAd(
      String codeId, double width, double height, GTAdsCallBack? callBack) {
    return //个性化模板信息流广告
        FlutterUnionad.nativeAdView(
      //android 信息流广告id 必填
      androidCodeId: codeId,
      //ios banner广告id 必填
      iosCodeId: codeId,
      //是否支持 DeepLink 选填
      supportDeepLink: true,
      // 期望view 宽度 dp 必填
      expressViewWidth: 375.5,
      //期望view高度 dp 必填
      expressViewHeight: 0,
      //一次请求广告数量 大于1小于3 必填
      expressNum: 2,
      mIsExpress: true,
      //控制下载APP前是否弹出二次确认弹窗
      downloadType: FlutterUnionadDownLoadType.DOWNLOAD_TYPE_POPUP,
      //是否启用点击 仅ios生效 默认启用
      isUserInteractionEnabled: true,
      //用于标注此次的广告请求用途为预加载（当做缓存）还是实时加载，
      adLoadType: FlutterUnionadLoadType.LOAD,
      callBack: FlutterUnionadNativeCallBack(
        onShow: () {
          if (callBack != null && callBack.onShow != null) {
            callBack.onShow!(getAlias(), codeId);
          }
        },
        onFail: (error) {
          if (callBack != null && callBack.onFail != null) {
            callBack.onFail!(getAlias(), codeId, error);
          }
        },
        onDislike: (message) {
          if (callBack != null && callBack.onClose != null) {
            callBack.onClose!(getAlias(), codeId);
          }
        },
        onClick: () {
          if (callBack != null && callBack.onClick != null) {
            callBack.onClick!(getAlias(), codeId);
          }
        },
      ),
    );
  }

  @override
  Widget bannerAd(
      String codeId, double width, double height, GTAdsCallBack? callBack) {
    return FlutterUnionad.bannerAdView(
      //andrrid banner广告id 必填
      androidCodeId: codeId,
      //ios banner广告id 必填
      iosCodeId: codeId,
      //是否使用个性化模版
      mIsExpress: true,
      //是否支持 DeepLink 选填
      supportDeepLink: true,
      //一次请求广告数量 大于1小于3 必填
      expressAdNum: 3,
      //轮播间隔事件 30-120秒  选填
      expressTime: 30,
      // 期望view 宽度 dp 必填
      expressViewWidth: 600.5,
      //期望view高度 dp 必填
      expressViewHeight: 120.5,
      //控制下载APP前是否弹出二次确认弹窗
      downloadType: FlutterUnionadDownLoadType.DOWNLOAD_TYPE_POPUP,
      //用于标注此次的广告请求用途为预加载（当做缓存）还是实时加载，
      adLoadType: FlutterUnionadLoadType.LOAD,
      //是否启用点击 仅ios生效 默认启用
      isUserInteractionEnabled: true,
      //广告事件回调 选填
      callBack: FlutterUnionadBannerCallBack(
        onShow: () {
          if (callBack != null && callBack.onShow != null) {
            callBack.onShow!(getAlias(), codeId);
          }
        },
        onFail: (error) {
          if (callBack != null && callBack.onFail != null) {
            callBack.onFail!(getAlias(), codeId, error);
          }
        },
        onDislike: (message) {
          if (callBack != null && callBack.onClose != null) {
            callBack.onClose!(getAlias(), codeId);
          }
        },
        onClick: () {
          if (callBack != null && callBack.onClick != null) {
            callBack.onClick!(getAlias(), codeId);
          }
        },
      ),
    );
  }

  @override
  Future<bool> insertAd(
      String adCode, bool isFull, double? width, double? height,GTAdsCallBack? callBack) {
    StreamSubscription? stream = null;
    stream = FlutterUnionadStream.initAdStream(
      flutterUnionadNewInteractionCallBack: FlutterUnionadNewInteractionCallBack(
        onShow: () {
          if (callBack?.onShow != null) {
            callBack?.onShow!(getAlias(), adCode);
          }
        },
        onSkip: () {},
        onClick: () {
          if (callBack?.onClick != null) {
            callBack?.onClick!(getAlias(), adCode);
          }
        },
        onFinish: () {
          if (callBack?.onFinish != null) {
            callBack?.onFinish!(getAlias(), adCode);
          }
          stream?.cancel();
        },
        onFail: (error) {
          print("拉取失败 $error");
          if (callBack?.onFail != null) {
            callBack?.onFail!(getAlias(), adCode, error);
          }
        },
        onClose: () {
          if (callBack?.onClose != null) {
            callBack?.onClose!(getAlias(), adCode);
          }
          stream?.cancel();
        },
        onReady: () async {
          print("拉取完成");
          await FlutterUnionad.showFullScreenVideoAdInteraction();
        },
        onUnReady: () {
          if (callBack?.onFail != null) {
            callBack?.onFail!(getAlias(), adCode, "未加载完成");
          }
        },
      ),
    );
    return FlutterUnionad.loadFullScreenVideoAdInteraction(
      //android 全屏广告id 必填
      androidCodeId: adCode,
      //ios 全屏广告id 必填
      iosCodeId: adCode,
      //是否支持 DeepLink 选填
      supportDeepLink: true,
      //视屏方向 选填
      orientation: FlutterUnionadOrientation.VERTICAL,
      //控制下载APP前是否弹出二次确认弹窗
      downloadType: FlutterUnionadDownLoadType.DOWNLOAD_TYPE_POPUP,
      //用于标注此次的广告请求用途为预加载（当做缓存）还是实时加载，
      adLoadType: FlutterUnionadLoadType.LOAD,
    );
  }

  @override
  Future<bool> rewardAd(String adCode, String rewardName, int rewardAmount,
      String userId, String customData,GTAdsCallBack? callBack) {
    StreamSubscription? stream = null;
    stream = FlutterUnionadStream.initAdStream(
      flutterUnionadRewardAdCallBack: FlutterUnionadRewardAdCallBack(
        onShow: () {
          if (callBack?.onShow != null) {
            callBack?.onShow!(getAlias(), adCode);
          }
        },
        onClick: () {
          if (callBack?.onClick != null) {
            callBack?.onClick!(getAlias(), adCode);
          }
        },
        onFail: (error) {
          //停止监听
          stream?.cancel();
          if (callBack?.onFail != null) {
            callBack?.onFail!(getAlias(), adCode, error);
          }
        },
        onClose: () {
          //停止监听
          stream?.cancel();
          if (callBack?.onClose != null) {
            callBack?.onClose!(getAlias(), adCode);
          }
        },
        onSkip: () {},
        onVerify: (rewardVerify, rewardAmount, rewardName, code, message) {
          if (callBack?.onClose != null) {
            callBack?.onVerify!(getAlias(), adCode, rewardVerify, "",
                rewardName, rewardAmount);
          }
        },
        onReady: () async {
          //显示激励广告
          await FlutterUnionad.showRewardVideoAd();
        },
        onUnReady: () {
          if (callBack?.onFail != null) {
            callBack?.onFail!(getAlias(), adCode, "激励广告预加载未准备就绪");
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
            callBack?.onExpand!(getAlias(), adCode, map);
          }
        },
      ),
    );
    return FlutterUnionad.loadRewardVideoAd(
      mIsExpress: false,
      //是否个性化 选填
      androidCodeId: adCode,
      //Android 激励视频广告id  必填
      iosCodeId: adCode,
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
  }
}
