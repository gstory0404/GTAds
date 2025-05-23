import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:gtads/gtads.dart';
import 'package:gtads_bqt/gtads_bqt.dart';

import 'banner_page.dart';
import 'native_page.dart';
import 'splash_page.dart';

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
    GTAds.addProvider(GTAdsBqtProvider("bqt", "b423d90d", "a6b7fed6"));
    initAd = await GTAds.init(isDebug: true);
    setPrivacy();
    setState(() {});
  }

  void setPrivacy() {
    GTAdsBqtProvider provider = GTAds.getProvider("bqt") as GTAdsBqtProvider;
    provider.privacy(
      readDeviceID: true,
      //读取设备ID的权限（建议授权）
      appList: true,
      //读取已安装应用列表权限（建议授权）
      location: true,
      //读取粗略地理位置权限
      storage: true,
      //读写外部存储权限
      personalAds: true,
      //设置限制个性化广告推荐
      bDPermission: true, //ios 新标志能力，该能力默认开启，如果有监管或隐私要求，在app内配置是否开启该能力。
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GTAds百度百青藤广告支持插件'),
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
                            alias: "bqt",
                            probability: 5,
                            androidId: "7792010",
                            iosId: "7800949")
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
                              alias: "bqt",
                              probability: 5,
                              androidId: "8351686",
                              iosId: "7803486")
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
