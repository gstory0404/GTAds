import 'package:gtads/gtads.dart';
// import 'package:gtads_bqt/gtads_bqt.dart';
import 'package:gtads_csj/gtads_csj.dart';
// import 'package:gtads_sigmob/gtads_sigmob.dart';
// import 'package:gtads_ylh/gtads_ylh.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/31 19:09
/// @Email gstory0404@gmail.com
/// @Description: 广告位

class Config {
  //穿山甲
  static String CSJ = "csj";

  //优量汇
  static String YLH = "ylh";

  //Sigmob
  static String SIGMOB = "sigmob";

  //百青藤
  static String BQT = "bqt";

  //广告
  static List<GTAdsProvider> providers = [
    GTAdsCsjProvider(CSJ, "5098580", "5098580", appName: 'flutter_test'),
    // GTAdsYlhProvider(YLH, "1200009850", "1200718557"),
    // GTAdsSigmobProvider(
    //     alias: SIGMOB,
    //     androidId: '6878',
    //     iosId: '6877',
    //     androidAppKey: '8ebc1fd1c27e650c',
    //     iosAppKey: 'eccdcdbd9adbd4a7'),
    // GTAdsBqtProvider(BQT, "b423d90d", "a6b7fed6")
  ];

  //横幅广告位
  static List<GTAdsCode> bannerCodes = [
    GTAdsCode(
        alias: CSJ, probability: 5, androidId: "102735527", iosId: "102735527"),
    GTAdsCode(
        alias: YLH,
        probability: 5,
        androidId: "8042711873318113",
        iosId: "5004358713683949")
  ];

  //信息流广告位
  static List<GTAdsCode> nativeCodes = [
    GTAdsCode(
        alias: CSJ, probability: 1, androidId: "102730271", iosId: "102730271"),
    GTAdsCode(
        alias: YLH,
        probability: 2,
        androidId: "4072918853903023",
        iosId: "6023578995600715"),
    GTAdsCode(
        alias: SIGMOB,
        probability: 3,
        androidId: "ed70b4760ff",
        iosId: "ed70b3615a5"),
    GTAdsCode(
        alias: BQT, probability: 4, androidId: "8352393", iosId: "8353656"),
  ];

  //开屏广告位
  static List<GTAdsCode> splashCodes = [
    GTAdsCode(
        alias: CSJ, probability: 1, androidId: "887367774", iosId: "887367774"),
    GTAdsCode(
        alias: YLH,
        probability: 2,
        androidId: "4052216802299999",
        iosId: "3053975955207733"),
    GTAdsCode(
        alias: SIGMOB,
        probability: 3,
        androidId: "ea1f8f21300",
        iosId: "ea1f8f9bd12"),
    GTAdsCode(
        alias: BQT, probability: 4, androidId: "7792007", iosId: "7803231"),
  ];

  //激励广告位
  static List<GTAdsCode> rewardCodes = [
    GTAdsCode(
        alias: CSJ, probability: 5, androidId: "945418088", iosId: "945418088"),
    GTAdsCode(
        alias: YLH,
        probability: 1,
        androidId: "5042816813706194",
        iosId: "4023171869997790"),
    GTAdsCode(
        alias: SIGMOB,
        probability: 1,
        androidId: "ea1f8ea2d90",
        iosId: "ea1f8f7b662"),
    GTAdsCode(
        alias: BQT, probability: 1, androidId: "7792010", iosId: "7800949"),
  ];

  //插屏广告位
  static List<GTAdsCode> insertCodes = [
    GTAdsCode(
        alias: CSJ, probability: 1, androidId: "946201351", iosId: "946201351"),
    GTAdsCode(
        alias: YLH,
        probability: 2,
        androidId: "9062813863614416",
        iosId: "5093576955904702"),
    GTAdsCode(
        alias: SIGMOB,
        probability: 3,
        androidId: "ea1f8f45d80",
        iosId: "ea1f8fb93fb"),
    GTAdsCode(
        alias: BQT, probability: 4, androidId: "8351686", iosId: "7803486"),
  ];
}
