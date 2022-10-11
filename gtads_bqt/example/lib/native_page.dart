import 'package:flutter/material.dart';
import 'package:gtads/gtads.dart';

/// @Author: gstory
/// @CreateDate: 2022/10/11 12:04
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
      appBar: AppBar(
        title: Text("信息流广告"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GTAdsNativeWidget(
              codes: [
                GTAdsCode(
                    alias: "bqt",
                    probability: 5,
                    androidId: "8352393",
                    iosId: "8353656")
              ],
              width: 300,
              height: 200,
              timeout: 6,
              callBack: GTAdsCallBack(
                onShow: (code) {
                  print("信息流显示 ${code.toJson()}");
                },
                onClick: (code) {
                  print("信息流点击 ${code.toJson()}");
                },
                onFail: (code, message) {
                  print("信息流错误 ${code?.toJson()} $message");
                },
                onClose: (code) {
                  print("信息流关闭 ${code.toJson()}");
                },
              ),
            ),
            GTAdsNativeWidget(
              codes: [
                GTAdsCode(
                    alias: "bqt",
                    probability: 5,
                    androidId: "8352393",
                    iosId: "8353656")
              ],
              width: 300,
              height: 200,
              timeout: 6,
            ),
            GTAdsNativeWidget(
              codes: [
                GTAdsCode(
                    alias: "bqt",
                    probability: 5,
                    androidId: "8352393",
                    iosId: "8353656")
              ],
              width: 300,
              height: 200,
              timeout: 6,
            ),
          ],
        ),
      ),
    );
  }
}
