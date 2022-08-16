part of 'gtads.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/16 10:27
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述 

abstract class GTAdsProvider{
  String adType = "";

  GTAdsCode? adsCode;

  ///初始化广告
  ///
  /// [code] 广告相关id
  Future<bool> initAd(GTAdsCode code);

  ///设置广告id
  void setCode(GTAdsCode code){
    adsCode = code;
  }

  ///横幅广告
  Widget? bannerAd(double width,double height);

  ///信息流广告
  Widget? nativeAd(double width,double height);

  ///开屏广告
  Widget? splashAd(double width,double height);
}


