import 'package:flutter/material.dart';
import 'package:gtads/base_provider.dart';
import 'package:gtads/gtads_manager.dart';
import 'dart:async';

part 'gtads_provider.dart';

part 'gtads_code.dart';

part 'gtads_callback.dart';

class GTAds {
  ///添加GTAdsProvider 必须实现[GTAdsProvider]
  ///
  /// [name] 广告别名 保证唯一不然无法添加进去
  ///
  static void addProvider(GTAdsProvider provider) {
    GTAdsManager.instance.addProviders(provider);
  }

  ///初始化广告组
  static Future<List<Map<String, bool>>> init({bool? isDebug}) async {
    List<Map<String, bool>> initList = [];
    for (var provider in GTAdsManager.instance.providers) {
      initList
          .add({provider.getAlias(): await provider.initAd(isDebug ?? false)});
    }
    return Future.value(initList);
  }

  ///获取指定广告
  ///
  /// [alias] 添加的别名
  static GTAdsProvider? getProvider(String alias) {
    List<GTAdsProvider> provider = GTAdsManager.instance.providers
        .where((element) => element.getAlias() == alias)
        .toList();
    if (provider.isNotEmpty) {
      return provider.first;
    }
    return null;
  }

  ///横幅广告
  ///
  /// [codes] 广告id
  ///
  /// [width] 宽
  ///
  /// [height] 高
  ///
  /// [callBack] 回调
  static Widget bannerAd({required List<GTAdsCode> codes,required double width,
    required double height,
    GTAdsCallBack? callBack}) {
    return GTAdsManager.instance.bannerAd(codes,width, height, callBack);
  }

  ///信息流广告
  ///
  /// [codes] 广告id
  ///
  /// [width] 宽
  ///
  /// [height] 高
  ///
  /// [callBack] 回调
  static Widget nativeAd({required List<GTAdsCode> codes,required double width,
    required double height,
    GTAdsCallBack? callBack}) {
    return GTAdsManager.instance.nativeAd(codes,width, height, callBack);
  }

  ///开屏广告
  ///
  /// [codes] 广告id
  ///
  /// [width] 宽
  ///
  /// [height] 高
  ///
  /// [callBack] 回调
  static Widget splashAd({required List<GTAdsCode> codes,required double width,
    required double height,
    GTAdsCallBack? callBack}) {
    return GTAdsManager.instance.splashAd(codes,width, height, callBack);
  }

  ///插屏广告
  ///
  /// [codes] 广告id
  ///
  /// [isFull] 是否全屏
  ///
  /// [width] 宽
  ///
  /// [height] 高
  ///
  /// [callBack] 广告监听
  static Future<bool> insertAd(
      {required List<GTAdsCode> codes,bool? isFull, double? width, double? height, GTAdsCallBack? callBack}) {
    return GTAdsManager.instance
        .insertAd(codes,isFull ?? true, width, height, callBack);
  }

  ///激励广告
  ///
  /// [codes] 广告id
  ///
  /// [rewardName] 奖励名称
  ///
  /// [rewardAmount] 奖励数量
  ///
  /// [userId] 用户id
  ///
  /// [customData] 自定义扩展字段
  ///
  /// [callBack] 广告监听
  static Future<bool> rewardAd({required List<GTAdsCode> codes,String? rewardName,
    int? rewardAmount,
    String? userId,
    String? customData,
    GTAdsCallBack? callBack}) {
    return GTAdsManager.instance.rewardAd(codes,rewardName ?? "", rewardAmount ?? 0,
        userId ?? "", customData ?? "", callBack);
  }
}
