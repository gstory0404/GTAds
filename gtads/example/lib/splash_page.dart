import 'package:flutter/material.dart';
import 'package:gtads/gtads.dart';
import 'package:gtads_example/config.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/18 15:18
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GTAdsSplashWidget(
        codes: Config.splashCodes,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        //超时时间 当广告失败后会依次重试其他广告 直至所有广告均加载失败 设置超时时间可提前取消
        timeout: 5,
        callBack: GTAdsCallBack(
          onShow: (code) {
            print("开屏显示 ${code.toJson()}");
          },
          onClick: (code) {
            print("开屏点击 ${code.toJson()}");
          },
          onFail: (code, message) {
            print("开屏错误 ${code?.toJson()} $message");
          },
          onClose: (code) {
            print("开屏关闭 ${code.toJson()}");
            Navigator.pop(context);
          },
          onTimeout: () {
            print("开屏加载超时");
            Navigator.pop(context);
          },
          onEnd: () {
            print("开屏所有广告位都加载失败");
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
