part of 'gtads_ylh.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/19 14:24
/// @Email gstory0404@gmail.com
/// @Description: 优量汇广告支持

class GTAdsYlhProvider extends GTAdsProvider {

  GTAdsYlhProvider(String alias, String? androidId, String? iosId) : super(alias, androidId, iosId);

  @override
  Future<bool> initAd(bool isDebug) {
    return FlutterTencentad.register(
        androidId: androidId ?? "", iosId: iosId ?? "", debug: isDebug);
  }

  @override
  Widget? bannerAd(
      GTAdsCode adCode, double width, double height, GTAdsCallBack? callBack) {
    return FlutterTencentad.bannerAdView(
      //android广告id
      androidId: adCode.androidId ?? "",
      //ios广告id
      iosId: adCode.iosId ?? "",
      //广告宽 单位dp
      viewWidth: width,
      //广告高  单位dp   宽高比应该为6.4:1
      viewHeight: height,
      //下载二次确认弹窗 默认false
      downloadConfirm: true,
      // 广告回调
      callBack: FlutterTencentadBannerCallBack(
        onShow: () {
          if (callBack != null && callBack.onShow != null) {
            callBack.onShow!(adCode);
          }
        },
        onFail: (code, message) {
          if (callBack != null && callBack.onFail != null) {
            callBack.onFail!(adCode, message);
          }
        },
        onClose: () {
          if (callBack != null && callBack.onClose != null) {
            callBack.onClose!(adCode);
          }
        },
        onExpose: () {},
        onClick: () {
          if (callBack != null && callBack.onClick != null) {
            callBack.onClick!(adCode);
          }
        },
      ),
    );
  }

  @override
  Future<bool> insertAd(GTAdsCode adCode, bool isFull, double? width,
      double? height, GTAdsCallBack? callBack) {
    StreamSubscription? stream;
    stream = FlutterTencentAdStream.initAdStream(
      flutterTencentadInteractionCallBack: FlutterTencentadInteractionCallBack(
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
        onFail: (code, message) {
          if (callBack != null && callBack.onFail != null) {
            callBack.onFail!(adCode, message);
          }
          stream?.cancel();
        },
        onClose: () {
          if (callBack != null && callBack.onClose != null) {
            callBack.onClose!(adCode);
            stream?.cancel();
          }
        },
        onReady: () async {
          await FlutterTencentad.showUnifiedInterstitialAD();
        },
        onUnReady: () {
          if (callBack != null && callBack.onFail != null) {
            callBack.onFail!(adCode, "广告未准备就绪");
          }
          stream?.cancel();
        },
        onVerify: (transId, rewardName, rewardAmount) {
          if (callBack != null && callBack.onVerify != null) {
            callBack.onVerify!(adCode, true, "", rewardName, rewardAmount);
            stream?.cancel();
          }
        },
      ),
    );
    return FlutterTencentad.loadUnifiedInterstitialAD(
      //android广告id
      androidId: adCode.androidId ?? "",
      //ios广告id
      iosId: adCode.androidId ?? "",
      //是否全屏
      isFullScreen: isFull,
      //下载二次确认弹窗 默认false
      downloadConfirm: true,
    );
  }

  @override
  Widget? nativeAd(
      GTAdsCode adCode, double width, double height, GTAdsCallBack? callBack) {
    return FlutterTencentad.expressAdView(
        //android广告id
        androidId: adCode.androidId ?? "",
        //ios广告id
        iosId: adCode.androidId ?? "",
        //广告宽 单位dp
        viewWidth: width.toInt(),
        //广告高  单位dp
        viewHeight: height.toInt(),
        //下载二次确认弹窗 默认false
        downloadConfirm: true,
        //回调事件
        callBack: FlutterTencentadExpressCallBack(
          onShow: () {
            if (callBack != null && callBack.onShow != null) {
              callBack.onShow!(adCode);
            }
          },
          onFail: (code, message) {
            if (callBack != null && callBack.onFail != null) {
              callBack.onFail!(adCode, message);
            }
          },
          onClose: () {
            if (callBack != null && callBack.onClose != null) {
              callBack.onClose!(adCode);
            }
          },
          onExpose: () {},
          onClick: () {
            if (callBack != null && callBack.onClick != null) {
              callBack.onClick!(adCode);
            }
          },
        ));
  }

  @override
  Future<bool> rewardAd(GTAdsCode adCode, String rewardName, int rewardAmount,
      String userId, String customData, GTAdsCallBack? callBack) {
    StreamSubscription? stream;
    stream = FlutterTencentAdStream.initAdStream(
      //激励广告
      flutterTencentadRewardCallBack:
          FlutterTencentadRewardCallBack(onShow: () {
        if (callBack != null && callBack.onShow != null) {
          callBack.onShow!(adCode);
        }
      }, onClick: () {
        if (callBack != null && callBack.onClick != null) {
          callBack.onClick!(adCode);
        }
      }, onFail: (code, message) {
        if (callBack != null && callBack.onFail != null) {
          callBack.onFail!(adCode, message);
        }
      }, onClose: () {
        if (callBack != null && callBack.onClose != null) {
          callBack.onClose!(adCode);
        }
        stream?.cancel();
      }, onReady: () async {
        await FlutterTencentad.showRewardVideoAd();
      }, onUnReady: () {
        if (callBack != null && callBack.onFail != null) {
          callBack.onFail!(adCode, "激励广告预加载未准备就绪");
        }
        stream?.cancel();
      }, onVerify: (transId, rewardName, rewardAmount) {
        if (callBack != null && callBack.onVerify != null) {
          callBack.onVerify!(adCode, true, transId, rewardName, rewardAmount);
        }
      }, onFinish: () {
        if (callBack != null && callBack.onFinish != null) {
          callBack.onFinish!(adCode);
          stream?.cancel();
        }
      }),
    );
    return FlutterTencentad.loadRewardVideoAd(
      //android广告id
      androidId: adCode.androidId ?? "",
      //ios广告id
      iosId: adCode.androidId ?? "",
      //用户id
      userID: userId,
      //奖励
      rewardName: rewardName,
      //奖励数
      rewardAmount: rewardAmount,
      //扩展参数 服务器回调使用
      customData: customData,
      //下载二次确认弹窗 默认false
      downloadConfirm: true,
    );
  }

  @override
  Widget? splashAd(
      GTAdsCode adCode, double width, double height, GTAdsCallBack? callBack) {
    return FlutterTencentad.splashAdView(
      //android广告id
      androidId: adCode.androidId ?? "",
      //ios广告id
      iosId: adCode.androidId ?? "",
      ////设置开屏广告从请求到展示所花的最大时长（并不是指广告曝光时长），取值范围为[1500, 5000]ms
      fetchDelay: 3000,
      //下载二次确认弹窗 默认false
      downloadConfirm: true,
      //广告回调
      callBack: FlutterTencentadSplashCallBack(
        onShow: () {
          if (callBack != null && callBack.onShow != null) {
            callBack.onShow!(adCode);
          }
        },
        onADTick: (time) {

        },
        onClick: () {
          if (callBack != null && callBack.onClick != null) {
            callBack.onClick!(adCode);
          }
        },
        onClose: () {
          if (callBack != null && callBack.onClose != null) {
            callBack.onClose!(adCode);
          }
        },
        onExpose: () {

        },
        onFail: (code, message) {
          if (callBack != null && callBack.onFail != null) {
            callBack.onFail!(adCode,message);
          }
        },
      ),
    );
  }
}
