part of 'gtads_ks.dart';

/// @Author: gstory
/// @CreateDate: 2023/3/2 16:00
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述

class GTAdsKSProvider extends GTAdsProvider {
  GTAdsKSProvider(String alias, String? androidId, String? iosId)
      : super(alias, androidId, iosId);

  @override
  Future<bool> initAd(bool isDebug) {
    return KSAd.register(
      //androidId
      androidId: androidId ?? "",
      //iosId
      iosId: iosId ?? "",
      //是否显示日志log
      debug: isDebug,
      //是否显示个性化推荐广告
      personal: true,
      programmatic: true,
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
    stream = KSAdStream.initAdStream(
        rewardCallBack: KSAdRewardCallBack(
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
        await KSAd.showRewardAd();
      },
      onUnReady: () {
        if (callBack?.onFail != null) {
          callBack?.onFail!(adCode, "激励广告预加载未准备就绪");
        }
      },
      onVerify: (hasReward, rewardName, rewardAmount) {
        if (callBack?.onVerify != null) {
          callBack?.onVerify!(adCode, hasReward, "", rewardName, rewardAmount);
        }
      },
    ));
    KSAd.loadRewardAd(
      //android广告id
      androidId: adCode.androidId ?? "",
      //ios广告id
      iosId: adCode.iosId ?? "",
      //用户id
      userID: userId,
      //奖励
      rewardName: rewardName,
      //奖励数
      rewardAmount: rewardAmount,
      //json扩展参数 服务器回调使用
      customData: customData,
    );
    return stream;
  }

  @override
  StreamSubscription? insertAd(
      GTAdsCode adCode, bool isFull, GTAdsCallBack? callBack) {
    StreamSubscription stream = KSAdStream.initAdStream(
        insertCallBack: KSAdInsertCallBack(
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
        await KSAd.showInsertAd();
      },
      onUnReady: () {
        if (callBack?.onFail != null) {
          callBack?.onFail!(adCode, "插屏广告预加载未准备就绪");
        }
      },
    ));
    KSAd.loadInsertAd(
      //android广告id
      androidId: adCode.androidId ?? "",
      //ios广告id
      iosId: adCode.iosId ?? "",
    );
    return stream;
  }

  @override
  Widget? splashAd(
      GTAdsCode adCode, double width, double height, GTAdsCallBack? callBack) {
    return KSAdSplashWidget(
      androidId: adCode.androidId ?? "",
      iosId: adCode.iosId ?? "",
      callBack: KSAdSplashCallBack(onShow: () {
        if (callBack?.onShow != null) {
          callBack?.onShow!(adCode);
        }
      }, onClick: () {
        if (callBack?.onClick != null) {
          callBack?.onClick!(adCode);
        }
      }, onSkip: () {
        if (callBack?.onClose != null) {
          callBack?.onClose!(adCode);
        }
      }, onClose: () {
        if (callBack?.onClose != null) {
          callBack?.onClose!(adCode);
        }
      }, onFail: (msg) {
        if (callBack?.onFail != null) {
          callBack?.onFail!(adCode, msg);
        }
      }),
    );
  }

  @override
  Widget? nativeAd(
      GTAdsCode adCode, double width, double height, GTAdsCallBack? callBack) {
    return KSAdNativeWidget(
      //andorid广告位id
      androidId: adCode.androidId ?? "",
      //ios广告位id
      iosId: adCode.iosId ?? "",
      //广告宽
      viewWidth: width.toInt(),
      //广告高 加载成功后会自动修改为sdk返回广告高
      viewHeight: height.toInt(),
      //广告回调
      callBack: KSAdNativeCallBack(
          onShow: (){
            if (callBack?.onShow != null) {
              callBack?.onShow!(adCode);
            }
          },
          onClose: (){
            if (callBack?.onClose != null) {
              callBack?.onClose!(adCode);
            }
          },
          onFail: (message){
            if (callBack?.onFail != null) {
              callBack?.onFail!(adCode, message);
            }
          },
          onClick: (){
            if (callBack?.onClick != null) {
              callBack?.onClick!(adCode);
            }
          }
      ),
    );
  }
}
