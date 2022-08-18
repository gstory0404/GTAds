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
      body: GTAds.splashAd(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        callBack: GTAdsCallBack(
          onShow: (alias, codeId) {
            print("开屏显示 厂商：$alias 广告ID:$codeId");
          },
          onClick: (alias, codeId) {
            print("开屏点击 厂商：$alias 广告ID:$codeId");
          },
          onFail: (alias, codeId, message) {
            print("开屏错误 厂商：$alias 广告ID:$codeId 错误信息:$message");
            Navigator.pop(context);
          },
          onClose: (alias, codeId) {
            print("开屏关闭 厂商：$alias 广告ID:$codeId");
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
