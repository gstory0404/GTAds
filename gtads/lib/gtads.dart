import 'package:flutter/material.dart';
import 'package:gtads/gtads_manager.dart';
import 'dart:async';

import 'package:gtads/gtads_util.dart';
import 'package:gtads/widget/gtads_insert.dart';
import 'package:gtads/widget/gtads_reward.dart';

part 'gtads_provider.dart';

part 'gtads_code.dart';

part 'gtads_callback.dart';

part 'widget/gtads_banner_widget.dart';

part 'widget/gtads_splash_widget.dart';

part 'widget/gtads_native_widget.dart';

part 'gtads_constant.dart';

class GTAds {

  ///添加GTAdsProvider 必须实现[GTAdsProvider]
  ///
  /// [name] 广告别名 保证唯一不然无法添加进去
  ///
  static void addProvider(GTAdsProvider provider) {
    GTAdsManager.instance.addProvider(provider);
  }

  ///添加GTAdsProvider 必须实现[GTAdsProvider]
  ///
  /// [name] 广告别名 保证唯一不然无法添加进去
  ///
  static void addProviders(List<GTAdsProvider> providers) {
    GTAdsManager.instance.addProviders(providers);
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

  ///移除GTAdsProvider
  ///
  /// [alias] 广告别名
  ///
  static void removeProvider(String alias) {
    GTAdsManager.instance.removeProvider(alias);
  }

  ///插屏广告
  ///
  /// [codes] 广告id
  ///
  /// [isFull] 是否全屏
  ///
  ///  [timeout] 超时时间 当广告失败后会依次重试其他广告 直至所有广告均加载失败 设置超时时间可提前取消
  ///
  ///  [model] 广告加载模式 [GTAdsModel.PRIORITY]优先级模式 [GTAdsModel.RANDOM]随机模式
  ///
  /// [callBack] 广告监听
  static Future<bool> insertAd(
      {required List<GTAdsCode> codes,
      bool? isFull,
      required int timeout,
      String? model,
      GTAdsCallBack? callBack}) {
    return GTAdsInsert(
            codes: codes,
            isFull: isFull ?? true,
            timeout: timeout,
            model: model ?? GTAdsModel.RANDOM,
            callBack: callBack)
        .init();
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
  ///  [timeout] 超时时间 当广告失败后会依次重试其他广告 直至所有广告均加载失败 设置超时时间可提前取消
  ///
  ///  [model] 广告加载模式 [GTAdsModel.PRIORITY]优先级模式 [GTAdsModel.RANDOM]随机模式
  ///
  /// [callBack] 广告监听
  static Future<bool> rewardAd(
      {required List<GTAdsCode> codes,
      String? rewardName,
      int? rewardAmount,
      String? userId,
      String? customData,
      String? model,
      required int timeout,
      GTAdsCallBack? callBack}) {
    return GTAdsReward(
            codes: codes,
            rewardName: rewardName ?? "",
            rewardAmount: rewardAmount ?? 0,
            userId: userId ?? "",
            customData: customData ?? "",
            timeout: timeout,
            model: model ?? GTAdsModel.RANDOM,
            callBack: callBack)
        .init();
  }
}
