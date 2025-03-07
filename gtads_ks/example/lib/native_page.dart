import 'package:flutter/material.dart';
import 'package:gtads/gtads.dart';

/// @Author: gstory
/// @CreateDate: 2023/3/2 16:29
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述
///

class NativePage extends StatefulWidget {
  const NativePage({Key? key}) : super(key: key);

  @override
  State<NativePage> createState() => _NativePageState();
}

class _NativePageState extends State<NativePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("信息流广告"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GTAdsNativeWidget(
              codes: [GTAdsCode(alias: "ksad", probability: 5,androidId: "22960000017",iosId: "22960000017")],
              width: 400,
              height: 200,
              timeout: 6,
              callBack: GTAdsCallBack(
                onShow: (code) {
                  print("信息流显示 ${code.toJson()}");
                },
                onClick: (code) {
                  print("信息流点击 ${code.toJson()}");
                },
                onFail: (code,message) {
                  print("信息流错误 ${code?.toJson()} $message");
                },
                onClose: (code) {
                  print("信息流关闭 ${code.toJson()}");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
