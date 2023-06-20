import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:gtads/gtads.dart';
import 'package:gtads_sigmob/gtads_sigmob.dart';
import 'package:gtads_sigmob_example/native_page.dart';
import 'package:gtads_sigmob_example/splash_page.dart';

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

  final String _alias = "sigmob";

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    GTAds.addProvider(GTAdsSigmobProvider(
        alias: _alias,
        androidId: '6878',
        iosId: '6877',
        androidAppKey: '8ebc1fd1c27e650c',
        iosAppKey: 'eccdcdbd9adbd4a7'));
    initAd = await GTAds.init(isDebug: true);
    GTAdsSigmobProvider? provider =
        GTAds.getProvider(_alias) as GTAdsSigmobProvider?;
    provider?.setUserId("123");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SigMob支持插件'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("初始化结果$initAd"),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text('激励广告'),
                  onPressed: () async {
                    var b = await GTAds.rewardAd(
                      codes: [
                        GTAdsCode(
                            alias: _alias,
                            probability: 5,
                            androidId: "ea1f8ea2d90",
                            iosId: "ea1f8f7b662")
                      ],
                      //奖励名称
                      rewardName: "100金币",
                      //奖励数量
                      rewardAmount: 100,
                      //用户id
                      userId: "user100",
                      //扩展参数
                      customData: "123",
                      timeout: 6,
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
                              alias: _alias,
                              probability: 5,
                              androidId: "ea1f8f45d80",
                              iosId: "ea1f8fb93fb")
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
