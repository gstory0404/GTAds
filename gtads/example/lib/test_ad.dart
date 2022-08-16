import 'package:flutter/material.dart';
import 'package:gtads/gtads.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/16 10:43
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述 

class TestAd extends GTAdsProvider{

  @override
  Future<bool> initAd(GTAdsCode code) {
    setCode(code);
    return Future.value(true);
  }

  @override
  Widget? bannerAd(double width,double height) {
    return null;
  }

  @override
  Widget? nativeAd(double width,double height) {
    return null;
  }

  @override
  Widget? splashAd(double width,double height) {
    return null;
  }
}

