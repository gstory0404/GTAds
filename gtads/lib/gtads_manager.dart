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
  GTAdsCode? randomCode(List<GTAdsCode> codes) {
    //最大数因子
    int max = 0;
    codes.forEach((element) {
      //过滤概率小于1的广告
      if(element.probability > 0){
        max += element.probability;
      }
    });
    if (max == 0) {
      return null;
    }
    int probability = Random().nextInt(max) + 1;
    int current = 0;
    for (int i = 0; i < codes.length; i++) {
      //过滤概率小于1的广告
      if(codes[i].probability > 0){
        if (current < probability &&
            probability <= current + codes[i].probability) {
          return codes[i];
        } else {
          current += current + codes[i].probability;
        }
      }
    }
    return null;
  }

  ///横幅广告
  Widget bannerAd(List<GTAdsCode> codes, double width, double height,
      GTAdsCallBack? callBack) {
    //如果不存在provider则返回一个空Container
    if (providers.length == 0) {
      return Container();
    }
    var code = randomCode(codes);
    if (code == null) {
      return Container();
    }
    GTAdsProvider? provider = null;
    providers.forEach((element) {
      if (element.getAlias() == code.alias) {
        provider = element;
      }
    });
    return provider?.bannerAd(code, width, height, callBack) ?? Container();
  }

  ///信息流广告
  Widget nativeAd(List<GTAdsCode> codes, double width, double height,
      GTAdsCallBack? callBack) {
    //如果不存在provider则返回一个空Container
    if (providers.length == 0) {
      return Container();
    }
    var code = randomCode(codes);
    if (code == null) {
      return Container();
    }
    GTAdsProvider? provider = null;
    providers.forEach((element) {
      if (element.getAlias() == code.alias) {
        provider = element;
      }
    });
    return provider?.nativeAd(code, width, height, callBack) ?? Container();
  }

  ///开屏广告
  Widget splashAd(List<GTAdsCode> codes, double width, double height,
      GTAdsCallBack? callBack) {
    //如果不存在provider则返回一个空Container
    if (providers.length == 0) {
      return Container();
    }
    var code = randomCode(codes);
    if (code == null) {
      return Container();
    }
    GTAdsProvider? provider = null;
    providers.forEach((element) {
      if (element.getAlias() == code.alias) {
        provider = element;
      }
    });
    return provider?.splashAd(code, width, height, callBack) ?? Container();
  }

  ///插屏广告
  Future<bool> insertAd(List<GTAdsCode> codes, bool isFull, double? width,
      double? height, GTAdsCallBack? callBack) {
    //如果不存在provider则返回一个空Container
    if (providers.length == 0) {
      return Future.value(false);
    }
    var code = randomCode(codes);
    if (code == null) {
      return Future.value(false);
    }
    GTAdsProvider? provider = null;
    providers.forEach((element) {
      if (element.getAlias() == code.alias) {
        provider = element;
      }
    });
    if (provider == null) {
      return Future.value(false);
    }
    return provider!.insertAd(code, isFull, width, height, callBack);
  }

  ///激励广告
  Future<bool> rewardAd(
      List<GTAdsCode> codes,
      String rewardName,
      int rewardAmount,
      String userId,
      String customData,
      GTAdsCallBack? callBack) {
    //如果不存在provider则返回一个空Container
    if (providers.length == 0) {
      return Future.value(false);
    }
    var code = randomCode(codes);
    if (code == null) {
      return Future.value(false);
    }
    GTAdsProvider? provider = null;
    providers.forEach((element) {
      if (element.getAlias() == code.alias) {
        provider = element;
      }
    });
    if (provider == null) {
      return Future.value(false);
    }
    return provider!
        .rewardAd(code, rewardName, rewardAmount, userId, customData, callBack);
  }
}
