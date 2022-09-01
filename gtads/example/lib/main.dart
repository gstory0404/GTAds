import 'package:flutter/material.dart';
import 'package:gtads/gtads.dart';
import 'package:gtads_example/banner_page.dart';
import 'package:gtads_example/config.dart';
import 'package:gtads_example/native_page.dart';
import 'package:gtads_example/splash_page.dart';

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
    //添加广告支持
    GTAds.addProvider(Config.providers);
    //初始化广告
    initAd = await GTAds.init(isDebug: true);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GTAds聚合广告插件'),
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
                      codes: Config.rewardCodes,
                      //奖励名称
                      rewardName: "100金币",
                      //奖励数量
                      rewardAmount: 100,
                      //用户id
                      userId: "user100",
                      //扩展参数
                      customData: "123",
                      //超时时间 当广告失败后会依次重试其他广告 直至所有广告均加载失败 设置超时时间可提前取消
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
                            "激励广告奖励验证 ${code.toJson()} $verify $transId $rewardName $rewardAmount");
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
                        codes: Config.insertCodes,
                        isFull: false,
                        //超时时间 当广告失败后会依次重试其他广告 直至所有广告均加载失败 设置超时时间可提前取消
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
