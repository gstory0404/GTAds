import 'package:gtads/gtads.dart';
import 'package:gtads_csj/gtads_csj.dart';
import 'package:gtads_ylh/gtads_ylh.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/31 19:09
/// @Email gstory0404@gmail.com
/// @Description: 广告位

class Config {
  //穿山甲
  static String CSJ = "csj";

  //优量汇
  static String YLH = "ylh";

  //广告
  static List<GTAdsProvider> providers = [
    GTAdsCsjProvider(CSJ, "5098580", "5098580"),
    GTAdsYlhProvider(YLH, "1200009850", "1200718557")
  ];

  //横幅广告位
  static List<GTAdsCode> bannerCodes = [
    GTAdsCode(
        alias: CSJ, probability: 5, androidId: "945410197", iosId: "945410197"),
    GTAdsCode(
        alias: YLH,
        probability: 5,
        androidId: "8042711873318113",
        iosId: "4043774915303757")
  ];

  //信息流广告位
  static List<GTAdsCode> nativeCodes = [
    GTAdsCode(
        alias: CSJ, probability: 5, androidId: "945417699", iosId: "945417699"),
    GTAdsCode(
        alias: YLH,
        probability: 5,
        androidId: "4072918853903023",
        iosId: "6023578995600715")
  ];

  //开屏广告位
  static List<GTAdsCode> splashCodes = [
    GTAdsCode(
        alias: CSJ, probability: 5, androidId: "887367774", iosId: "887367774"),
    GTAdsCode(
        alias: YLH,
        probability: 5,
        androidId: "4052216802299999",
        iosId: "3053975955207733")
  ];

  //激励广告位
  static List<GTAdsCode> rewardCodes = [
    GTAdsCode(
        alias: CSJ, probability: 5, androidId: "945418088", iosId: "945418088"),
    GTAdsCode(
        alias: YLH,
        probability: 5,
        androidId: "5042816813706194",
        iosId: "4023171869997790"),
  ];

  //插屏广告位
  static List<GTAdsCode> insertCodes = [
    GTAdsCode(
        alias: CSJ, probability: 5, androidId: "946201351", iosId: "946201351"),
    GTAdsCode(
        alias: YLH,
        probability: 5,
        androidId: "9062813863614416",
        iosId: "5093576955904702"),
  ];
}
