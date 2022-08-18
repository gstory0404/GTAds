import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gtads/gtads.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/16 15:44
/// @Email gstory0404@gmail.com
/// @Description: 广告管理类

class GTAdsManager {
  factory GTAdsManager() => _getInstance();

  static GTAdsManager get instance => _getInstance();

  static GTAdsManager? _instance;

  static GTAdsManager _getInstance() {
    if (_instance == null) {
      _instance = GTAdsManager._();
    }
    return _instance!;
  }

  GTAdsManager._() {}

  //provider组
  List<GTAdsProvider> providers = [];

  //添加adProvider
  void addProviders(GTAdsProvider provider) {
    if (!providers.contains(provider)) {
      providers.add(provider);
    }
  }

  //获取随机广告组件
  GTAdsProvider? randomProvider(String type) {
    List<GTAdsProvider> nowProvider = [];
    providers.forEach((element) {
      switch (type) {
        case "banner":
          if (element
              .getGTAdsCode()
              .bannerIds != null &&
              element
                  .getGTAdsCode()
                  .bannerIds!
                  .length > 0) {
            nowProvider.add(element);
          }
          break;
        case "native":
          if (element
              .getGTAdsCode()
              .nativeIds != null &&
              element
                  .getGTAdsCode()
                  .nativeIds!
                  .length > 0) {
            nowProvider.add(element);
          }
          break;
        case "splash":
          if (element
              .getGTAdsCode()
              .splashIds != null &&
              element
                  .getGTAdsCode()
                  .splashIds!
                  .length > 0) {
            nowProvider.add(element);
          }
          break;
        case "insert":
          if (element
              .getGTAdsCode()
              .insertIds != null &&
              element
                  .getGTAdsCode()
                  .insertIds!
                  .length > 0) {
            nowProvider.add(element);
          }
          break;
        case "reward":
          if (element
              .getGTAdsCode()
              .rewardIds != null &&
              element
                  .getGTAdsCode()
                  .rewardIds!
                  .length > 0) {
            nowProvider.add(element);
          }
          break;
      }
    });
    if(nowProvider.length == 0){
      return null;
    }
    //最大数因子
    int max = 0;
    nowProvider.forEach((element) {
      max += element.probability;
    });
    if(max == 0){
      return null;
    }
    int probability = Random().nextInt(max) + 1;
    int current = 0;
    for (int i = 0; i < nowProvider.length; i++) {
      if (current < probability &&
          probability <= current + nowProvider[i].getProbability()) {
        return providers[i];
      } else {
        current += nowProvider[i].getProbability();
      }
    }
    return null;
  }

  ///横幅广告
  Widget bannerAd(double width, double height, GTAdsCallBack? callBack) {
    //如果不存在provider则返回一个空Container
    if (providers.length == 0) {
      return Container();
    }
    var provider = randomProvider("banner");
    if (provider == null) {
      return Container();
    }
    String adCode = provider.adsCode
        .bannerIds![Random().nextInt(provider.adsCode.bannerIds!.length)];
    return provider.bannerAd(adCode, width, height, callBack) ?? Container();
  }

  ///信息流广告
  Widget nativeAd(double width, double height, GTAdsCallBack? callBack) {
    //如果不存在provider则返回一个空Container
    if (providers.length == 0) {
      return Container();
    }
    var provider = randomProvider("native");
    if (provider == null) {
      return Container();
    }
    String adCode = provider.adsCode
        .nativeIds![Random().nextInt(provider.adsCode.nativeIds!.length)];
    return provider.nativeAd(adCode, width, height, callBack) ?? Container();
  }

  ///开屏广告
  Widget splashAd(double width, double height, GTAdsCallBack? callBack) {
    //如果不存在provider则返回一个空Container
    if (providers.length == 0) {
      return Container();
    }
    var provider = randomProvider("splash");
    if (provider == null) {
      return Container();
    }
    String adCode = provider.adsCode
        .splashIds![Random().nextInt(provider.adsCode.splashIds!.length)];
    return provider.splashAd(adCode, width, height, callBack) ?? Container();
  }

  ///插屏广告
  Future<bool> insertAd(bool isFull, double? width, double? height,GTAdsCallBack? callBack) {
    //如果不存在provider则返回一个空Container
    if (providers.length == 0) {
      return Future.value(false);
    }
    var provider = randomProvider("insert");
    if (provider == null) {
      return Future.value(false);
    }
    String adCode = provider.adsCode
        .insertIds![Random().nextInt(provider.adsCode.insertIds!.length)];
    return provider.insertAd(adCode, isFull, width, height,callBack);
  }

  ///激励广告
  Future<bool> rewardAd(String rewardName, int rewardAmount, String userId,
      String customData,GTAdsCallBack? callBack) {
    //如果不存在provider则返回一个空Container
    if (providers.length == 0) {
      return Future.value(false);
    }
    var provider = randomProvider("reward");
    if (provider == null) {
      return Future.value(false);
    }
    String adCode = provider.adsCode
        .rewardIds![Random().nextInt(provider.adsCode.rewardIds!.length)];
    return provider.rewardAd(
        adCode, rewardName, rewardAmount, userId, customData,callBack);
  }
}
