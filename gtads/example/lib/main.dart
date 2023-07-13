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
    GTAds.addProviders(Config.providers);
    //初始化广告
    initAd = await GTAds.init(isDebug: true);
    // loadInsertAd();
    setState(() {});
  }

  void loadInsertAd() async{
    await GTAds.insertAd(
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
          onTimeout: () {
            print("插屏广告加载超时");
          },
          onEnd: () {
            print("插屏广告所有广告位都加载失败");
          },
        ));
  }

  void loadRewardAd() async{
    await GTAds.rewardAd(
      codes: Config.rewardCodes,
      //奖励名称
      rewardName: "100金币",
      //奖励数量
      rewardAmount: 100,
      //用户id
      userId: "user100",
      //扩展参数
      customData: "123",
      model: GTAdsModel.RANDOM,
      //超时时间 当广告失败后会依次重试其他广告 直至所有广告均加载失败 设置超时时间可提前取消
      timeout: 6,
      callBack: GTAdsCallBack(
        onShow: (code) {
          print("激励广告显示 ${code.toJson()}");
        },
        onFail: (code, message) {
          print("激励广告失败 ${code?.toJson()} $message");
        },
        onClick: (code) {
          print("激励广告点击 ${code.toJson()}");
        },
        onClose: (code) {
          print("激励广告关闭 ${code.toJson()}");
        },
        onVerify:
            (code, verify, transId, rewardName, rewardAmount) {
          print(
              "激励广告奖励验证 ${code.toJson()} $verify $transId $rewardName $rewardAmount");
        },
        onExpand: (code, param) {
          print("激励广告自定义参数 ${code.toJson()} $param");
        },
        onTimeout: () {
          print("激励广告加载超时");
        },
        onEnd: () {
          print("激励广告所有广告位都加载失败");
        },
      ),
    );
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
                   loadRewardAd();
                  },
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text('插屏广告'),
                  onPressed: () async {
                    print("广告位数量 ${Config.insertCodes.length}");
                    loadInsertAd();
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
