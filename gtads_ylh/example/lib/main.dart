import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:gtads/gtads.dart';
import 'package:gtads_ylh/gtads_ylh.dart';
import 'package:gtads_ylh_example/banner_page.dart';
import 'package:gtads_ylh_example/native_page.dart';
import 'package:gtads_ylh_example/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Index(),
    );
  }
}

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List<Map<String, bool>> initAd = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    GTAds.addProvider(
        GTAdsYlhProvider("ylh", "1200009850", "1200718557", androidPrivacy: {
      //优量汇SDK将不采集mac地址
      "mac_address": false,
      //允许优量汇SDK采集android_id
      "android_id": false,
      //允许收集ip
      "wipaddr": false
    }));
    initAd = await GTAds.init(isDebug: true);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GTAds_ylh demo'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("初始化结果$initAd"),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text('横幅广告'),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BannerPage(),
                      ),
                    );
                  },
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text('激励广告'),
                  onPressed: () async {
                    var b = await GTAds.rewardAd(
                      codes: [
                        GTAdsCode(
                            alias: "ylh",
                            probability: 5,
                            androidId: "5042816813706194",
                            iosId: "3035541744552914")
                      ],
                      //奖励名称
                      rewardName: "100金币",
                      //奖励数量
                      rewardAmount: 100,
                      //用户id
                      userId: "user100",
                      //扩展参数
                      customData: "123",
                      timeout: 10,
                      callBack: GTAdsCallBack(onShow: (code) {
                        print("激励广告显示 ${code.toJson()}");
                      }, onFail: (code, message) {
                        print("激励广告失败 ${code?.toJson()} $message");
                      }, onClick: (code) {
                        print("激励广告点击 ${code.toJson()}");
                      }, onClose: (code) {
                        print("激励广告关闭 ${code.toJson()}");
                      }, onVerify:
                          (code, verify, transId, rewardName, rewardAmount) {
                        print(
                            "激励广告奖励 ${code.toJson()} $verify $transId $rewardName $rewardAmount");
                      }, onExpand: (code, param) {
                        print("激励广告自定义参数 ${code.toJson()} $param");
                      }),
                    );
                    if (b) {
                      print("激励广告开始请求");
                    } else {
                      print("激励广告开始请求失败");
                    }
                  },
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text('插屏广告'),
                  onPressed: () async {
                    var b = await GTAds.insertAd(
                        codes: [
                          GTAdsCode(
                              alias: "ylh",
                              probability: 5,
                              androidId: "2015540734459587",
                              iosId: "5095940784157969")
                        ],
                        isFull: false,
                        timeout: 6,
                        callBack: GTAdsCallBack(
                          onShow: (code) {
                            print("插屏广告显示 ${code.toJson()}");
                          },
                          onFail: (code, message) {
                            print("插屏广告失败 ${code?.toJson()} $message");
                          },
                          onClick: (code) {
                            print("插屏广告点击 ${code.toJson()}");
                          },
                          onClose: (code) {
                            print("插屏广告关闭 ${code.toJson()}");
                          },
                        ));
                    if (b) {
                      print("插屏广告开始请求");
                    }
                  },
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text('开屏广告'),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SplashPage(),
                      ),
                    );
                  },
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text('信息流广告'),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NativePage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
