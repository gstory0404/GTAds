import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gtads/gtads.dart';
import 'package:gtads/gtads_util.dart';

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

  /// 添加adProviders
  void addProviders(List<GTAdsProvider> list) {
    providers = list;
  }

  /// 添加adProvider
  ///
  /// 在GTAds.init后调用 则必须先执行GTAdsProvider.init
  void addProvider(GTAdsProvider provider) {
    providers.add(provider);
  }

  /// 根据alias移除Provider
  void removeProvider(String alias) {
    providers.removeWhere((element) => element.getAlias() == alias);
  }
}
