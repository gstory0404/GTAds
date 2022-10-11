import 'package:flutter/material.dart';
import 'package:gtads/gtads.dart';

/// @Author: gstory
/// @CreateDate: 2022/10/11 12:00
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述

class BannerPage extends StatefulWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  _BannerPageState createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "banner广告",
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: false,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            GTAdsBannerWidget(
                codes: [
                  GTAdsCode(
                      alias: "bqt",
                      probability: 5,
                      androidId: "7792006",
                      iosId: "8280989")
                ],
                //宽
                width: 300,
                //高
                height: 400,
                timeout: 5,
                //回调
                callBack: GTAdsCallBack(
                  onShow: (code) {
                    print("Banner显示 ${code.toJson()}");
                  },
                  onClick: (code) {
                    print("Banner点击 ${code.toJson()}");
                  },
                  onFail: (code, message) {
                    print("Banner错误 ${code?.toJson()} $message");
                  },
                  onClose: (code) {
                    print("Banner关闭 ${code.toJson()}");
                  },
                )),
            GTAdsBannerWidget(
              codes: [
                GTAdsCode(
                    alias: "bqt",
                    probability: 5,
                    androidId: "7792006",
                    iosId: "8360367")
              ],
              //宽
              width: 300,
              //高
              height: 400,
              timeout: 5,
            ),
          ],
        ),
      ),
    );
  }
}
