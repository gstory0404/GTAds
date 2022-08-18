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
            GTAds.bannerAd(
                //宽
                width: 300,
                //高
                height: 400,
                //回调
                callBack: GTAdsCallBack(
                  onShow: (alias, codeId) {
                    print("Banner显示 厂商：$alias 广告ID:$codeId");
                  },
                  onClick: (alias, codeId) {
                    print("Banner点击 厂商：$alias 广告ID:$codeId");
                  },
                  onFail: (alias, codeId, message) {
                    print("Banner错误 厂商：$alias 广告ID:$codeId 错误信息:$message");
                  },
                  onClose: (alias, codeId) {
                    print("Banner关闭 厂商：$alias 广告ID:$codeId");
                  },
                )),
            GTAds.getProvider("csj")?.bannerAd("945410197", 200, 400, null) ??
                Container(),
            GTAds.getProvider("csj2222")
                    ?.bannerAd("945410197", 200, 400, null) ??
                Container(),
          ],
        ),
      ),
    );
  }
}
