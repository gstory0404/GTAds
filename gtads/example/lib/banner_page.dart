import 'package:flutter/material.dart';
import 'package:gtads/gtads.dart';
import 'package:gtads_example/config.dart';

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
                codes: [...Config.bannerCodes],
                //宽
                width: 300,
                //高
                height: 60,
                //超时时间 当广告失败后会依次重试其他广告 直至所有广告均加载失败 设置超时时间可提前取消
                timeout: 5,
                model: GTAdsModel.RANDOM,
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
                  onTimeout: () {
                    print("Banner加载超时");
                  },
                  onEnd: () {
                    print("Banner所有广告位都加载失败");
                  },
                )),
            GTAdsBannerWidget(
                codes: Config.bannerCodes,
                //宽
                width: 300,
                //高
                height: 60,
                timeout: 5,
                model: GTAdsModel.RANDOM,
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
                  onTimeout: () {
                    print("Banner加载超时");
                  },
                  onEnd: () {
                    print("Banner所有广告位都加载失败");
                  },
                )),
            GTAdsBannerWidget(
                codes: Config.bannerCodes,
                //宽
                width: 300,
                //高
                height: 60,
                timeout: 5,
                model: GTAdsModel.RANDOM,
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
                  onTimeout: () {
                    print("Banner加载超时");
                  },
                  onEnd: () {
                    print("Banner所有广告位都加载失败");
                  },
                )),
            GTAdsBannerWidget(
                codes: Config.bannerCodes,
                //宽
                width: 300,
                //高
                height: 80,
                timeout: 5,
                model: GTAdsModel.PRIORITY,
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
                  onTimeout: () {
                    print("Banner加载超时");
                  },
                  onEnd: () {
                    print("Banner所有广告位都加载失败");
                  },
                )),
            GTAdsBannerWidget(
                codes: Config.bannerCodes,
                //宽
                width: 300,
                //高
                height: 80,
                timeout: 5,
                model: GTAdsModel.PRIORITY,
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
                  onTimeout: () {
                    print("Banner加载超时");
                  },
                  onEnd: () {
                    print("Banner所有广告位都加载失败");
                  },
                )),
          ],
        ),
      ),
    );
  }
}
