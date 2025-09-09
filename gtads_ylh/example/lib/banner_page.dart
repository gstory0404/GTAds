import 'package:flutter/material.dart';
import 'package:gtads/gtads.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/16 17:12
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
                      alias: "ylh",
                      probability: 5,
                      androidId: "3280862472037698",
                      iosId: "2240669472733809")
                ],
                //宽
                width: 300,
                //高
                height: 400,
                timeout: 6,
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
          ],
        ),
      ),
    );
  }
}
