import 'package:flutter/material.dart';
import 'package:gtads/gtads.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/18 15:41
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述

class NativePage extends StatefulWidget {
  const NativePage({Key? key}) : super(key: key);

  @override
  State<NativePage> createState() => _NativePageState();
}

class _NativePageState extends State<NativePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            GTAds.nativeAd(
              width: 300,
              height: 200,
              callBack: GTAdsCallBack(
                onShow: (alias, codeId) {
                  print("信息流显示 厂商：$alias 广告ID:$codeId");
                },
                onClick: (alias, codeId) {
                  print("信息流点击 厂商：$alias 广告ID:$codeId");
                },
                onFail: (alias, codeId, message) {
                  print("信息流错误 厂商：$alias 广告ID:$codeId 错误信息:$message");
                },
                onClose: (alias, codeId) {
                  print("信息流关闭 厂商：$alias 广告ID:$codeId");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
