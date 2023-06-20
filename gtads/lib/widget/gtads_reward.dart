import 'dart:async';

import 'package:gtads/gtads.dart';
import 'package:gtads/gtads_manager.dart';
import 'package:gtads/gtads_util.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/31 19:38
/// @Email gstory0404@gmail.com
/// @Description: 激励广告

class GTAdsReward {
  final List<GTAdsCode> codes;
  final String rewardName;
  final int rewardAmount;
  final String userId;
  final String customData;
  final int timeout;
  final String model;
  final GTAdsCallBack? callBack;

  GTAdsReward(
      {required this.codes,
      required this.rewardName,
      required this.rewardAmount,
      required this.userId,
      required this.customData,
      required this.timeout,
      required this.model,
      this.callBack});

  //当前广告提供者
  GTAdsProvider? _provider;

  //provider组
  List<GTAdsProvider> _providers = [];

  //广告id
  GTAdsCode? _code;

  //定时器
  Timer? _timer;

  //广告监听
  StreamSubscription? _stream;

  Future<bool> init() {
    _providers = GTAdsManager.instance.providers;
    startTime();
    return _loadAd();
  }

  //开始计时
  void startTime() {
    _timer = Timer.periodic(Duration(seconds: timeout), (timer) {
      _stream?.cancel();
      if (callBack?.onTimeout != null) {
        //获取广告超时
        callBack?.onTimeout!();
      }
      _timer?.cancel();
    });
  }

  //开始加载广告
  Future<bool> _loadAd() async {
    //如果不存在provider则返回一个空Container
    if (_providers.length == 0) {
      _stream?.cancel();
      _timer?.cancel();
      if (callBack?.onEnd != null) {
        //暂无可加载广告
        callBack?.onEnd!();
      }
      return Future.value(false);
    }
    _code = GTAdsUtil.getCode(model, codes);
    //如果未获取到code 则直接返回
    if (_code == null) {
      _stream?.cancel();
      _timer?.cancel();
      if (callBack?.onEnd != null) {
        //暂无可加载广告
        callBack?.onEnd!();
      }
      return Future.value(false);
    }
    //循环获取provider
    for (var value in _providers) {
      if (value.getAlias() == _code?.alias) {
        _provider = value;
      }
    }
    //如果未查询到可使用provider 则直接返回
    if (_provider == null) {
      _stream?.cancel();
      _timer?.cancel();
      if (callBack?.onEnd != null) {
        //暂无可加载广告
        callBack?.onEnd!();
      }
      return Future.value(false);
    }
    _stream = _provider?.rewardAd(
      _code!,
      rewardName,
      rewardAmount,
      userId,
      customData,
      GTAdsCallBack(
        onShow: (code) {
          //移除计时
          _timer?.cancel();
          if (callBack?.onShow != null) {
            callBack?.onShow!(code);
          }
        },
        onClick: (code) {
          if (callBack?.onClick != null) {
            callBack?.onClick!(code);
          }
        },
        onClose: (code) {
          if (callBack?.onClose != null) {
            callBack?.onClose!(code);
          }
          _stream?.cancel();
        },
        onFail: (code, message) {
          if (callBack?.onFail != null) {
            callBack?.onFail!(code, message);
          }
          //移除当前错误code
          codes.remove(code);
          _stream?.cancel();
          //重试 直至codes数组为空
          _loadAd();
        },
        onExpand: (code, param) {
          if (callBack?.onExpand != null) {
            callBack?.onExpand!(code, param);
          }
        },
        onVerify: (code, verify, transId, rewardName, rewardAmount) {
          if (callBack?.onVerify != null) {
            callBack?.onVerify!(
                code, verify, transId, rewardName, rewardAmount);
          }
        },
        onFinish: (code) {
          if (callBack?.onFinish != null) {
            callBack?.onFinish!(code);
          }
        },
      ),
    );
    if (_stream == null) {
      //移除当前错误code
      codes.remove(_code);
      //重试 直至codes数组为空
      _loadAd();
    }
    return Future.value(true);
  }
}
