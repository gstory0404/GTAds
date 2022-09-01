import 'package:flutter/material.dart';
import 'package:gtads/gtads.dart';

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
        codes: [GTAdsCode(alias: "sigmob", probability: 5,androidId: "ea1f8f21300",iosId: "ea1f8f9bd12")],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        timeout: 6,
        callBack: GTAdsCallBack(
          onShow: (code) {
            print("开屏显示 ${code.toJson()}");
          },
          onClick: (code) {
            print("开屏点击 ${code.toJson()}");
          },
          onFail: (code, message) {
            print("开屏错误 ${code?.toJson()} $message");
            Navigator.pop(context);
          },
          onClose: (code) {
            print("开屏关闭 ${code.toJson()}");
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
