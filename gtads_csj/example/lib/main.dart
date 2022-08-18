import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gtads/gtads_manager.dart';
import 'package:gtads_csj/gtads_csj.dart';
import 'package:gtads/gtads.dart';
import 'package:gtads_csj_example/banner_page.dart';
import 'package:gtads_csj_example/native_page.dart';
import 'package:gtads_csj_example/splash_page.dart';

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

  late GTAdsProvider _provider;

  Future<void> init() async {
    GTAds.addProvider(GTAdsCsjProvider(
        alias: "csj",
        probability: 6,
        adsCode: GTAdsCode(
          appId: "5098580",
          bannerIds: ["945410197", "945410197"],
          splashIds: ["887367774"],
          nativeIds: ["945417699"],
          insertIds: ["946201351"],
          rewardIds: ["945418088"],
        )));
    initAd = await GTAds.init(isDebug: true);
    print(initAd);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
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
                      //奖励名称
                      rewardName: "100金币",
                      //奖励数量
                      rewardAmount: 100,
                      //用户id
                      userId: "user100",
                      //扩展参数
                      customData: "123",
                      callBack: GTAdsCallBack(
                        onShow: (alias, codeId) {
                          print("激励广告显示 $alias  $codeId");
                        },
                        onFail: (alias, codeId, message) {
                          print("激励广告失败 $alias  $codeId $message");
                        },
                        onClick: (alias, codeId) {
                          print("激励广告点击 $alias  $codeId");
                        },
                        onClose: (alias, codeId) {
                          print("激励广告关闭 $alias  $codeId");
                        },
                        onVerify: (alias, codeId, verify, transId, rewardName,
                            rewardAmount) {
                          print(
                              "激励广告关闭 $alias  $codeId $verify $transId $rewardName $rewardAmount");
                        },
                      ),
                    );
                    if (b) {
                      print("激励广告开始请求");
                    }else{
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
                        isFull: false,
                        width: 300,
                        height: 500,
                        callBack: GTAdsCallBack(
                          onShow: (alias, codeId) {
                            print("插屏广告显示 $alias  $codeId");
                          },
                          onFail: (alias, codeId, message) {
                            print("插屏广告失败 $alias  $codeId $message");
                          },
                          onClick: (alias, codeId) {
                            print("插屏广告点击 $alias  $codeId");
                          },
                          onClose: (alias, codeId) {
                            print("插屏广告关闭 $alias  $codeId");
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
