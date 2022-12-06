import 'package:flutter/material.dart';
import 'package:gtads/gtads.dart';
import 'package:gtads_example/config.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "信息流广告",
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: false,
        physics: const BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              GTAdsNativeWidget(
                codes: Config.nativeCodes,
                width: 300,
                height: 200,
                //超时时间 当广告失败后会依次重试其他广告 直至所有广告均加载失败 设置超时时间可提前取消
                timeout: 5,
                model: GTAdsModel.RANDOM,
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
                  onTimeout: () {
                    print("Banner加载超时");
                  },
                  onEnd: () {
                    print("Banner所有广告位都加载失败");
                  },
                ),
              ),
              GTAdsNativeWidget(
                codes: Config.nativeCodes,
                width: 300,
                height: 200,
                timeout: 5,
                model: GTAdsModel.PRIORITY,
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
                  onTimeout: () {
                    print("Banner加载超时");
                  },
                  onEnd: () {
                    print("Banner所有广告位都加载失败");
                  },
                ),
              ),
              GTAdsNativeWidget(
                codes: Config.nativeCodes,
                width: 300,
                height: 200,
                timeout: 5,
                model: GTAdsModel.PRIORITY,
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
                  onTimeout: () {
                    print("Banner加载超时");
                  },
                  onEnd: () {
                    print("Banner所有广告位都加载失败");
                  },
                ),
              ),
              GTAdsNativeWidget(
                codes: Config.nativeCodes,
                width: 300,
                height: 200,
                timeout: 5,
                model: GTAdsModel.PRIORITY,
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
                  onTimeout: () {
                    print("信息流加载超时");
                  },
                  onEnd: () {
                    print("信息流所有广告位都加载失败");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
