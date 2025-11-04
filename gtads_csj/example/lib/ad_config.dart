import 'package:gtads/gtads.dart';

// import 'package:gtads_bqt/gtads_bqt.dart';
import 'package:gtads_csj/gtads_csj.dart';

// import 'package:gtads_sigmob/gtads_sigmob.dart';
// import 'package:gtads_ylh/gtads_ylh.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/31 19:09
/// @Email gstory0404@gmail.com
/// @Description: 广告位

class AdConfig {
  //穿山甲
  static String CSJ = "csj";

  //广告
  static List<GTAdsProvider> providers = [
    GTAdsCsjProvider(
      CSJ,
      "5750023",
      "5750023",
      appName: 'flutter_test',
      ohosId: "",
      useMediation: true,
      androidPrivacy: AndroidPrivacy(),
      iosPrivacy: IOSPrivacy(),
    ),
  ];

  //横幅广告位
  static List<GTAdsCode> bannerCodes = [
    GTAdsCode(
        alias: CSJ, probability: 5, androidId: "103686668", iosId: "103686668"),
  ];

  //信息流广告位
  static List<GTAdsCode> nativeCodes = [
    GTAdsCode(
        alias: CSJ, probability: 1, androidId: "103686791", iosId: "103686791"),
  ];

  //开屏广告位
  static List<GTAdsCode> splashCodes = [
    GTAdsCode(
        alias: CSJ, probability: 1, androidId: "887367774", iosId: "887367774"),
  ];

  //激励广告位
  static List<GTAdsCode> rewardCodes = [
    GTAdsCode(
        alias: CSJ, probability: 5, androidId: "103685185", iosId: "103685185"),
  ];

  //插屏广告位
  static List<GTAdsCode> insertCodes = [
    GTAdsCode(
        alias: CSJ, probability: 1, androidId: "103687132", iosId: "103687132"),
  ];
}
