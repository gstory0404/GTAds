import 'dart:async';

import 'package:gtads/gtads.dart';
import 'package:gtads/gtads_manager.dart';
import 'package:gtads/gtads_util.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/31 19:55
/// @Email gstory0404@gmail.com
/// @Description: 插屏广告

class GTAdsInsert {
  final List<GTAdsCode> codes;
  final bool isFull;
  final int timeout;
  final GTAdsCallBack? callBack;

  GTAdsInsert(
      {required this.codes,
        required this.isFull,
        required this.timeout,
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
      if (callBack?.onFail != null) {
        _stream?.cancel();
        callBack?.onFail!(null, "获取广告超时");
        print("获取广告超时");
      }
      _timer?.cancel();
    });
  }

  //开始加载广告
  Future<bool> _loadAd() async {
    //如果不存在provider则返回一个空Container
    if (_providers.length == 0) {
      if (callBack?.onFail != null) {
        _stream?.cancel();
        callBack?.onFail!(null, "暂无可加载广告");
      }
      return Future.value(false);
    }
    _code = GTAdsUtil.randomCode(codes);
    //如果未获取到code 则直接返回
    if (_code == null) {
      _stream?.cancel();
      if (callBack?.onFail != null) {
        callBack?.onFail!(null, "暂无可加载广告");
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
      if (callBack?.onFail != null) {
        callBack?.onFail!(null, "暂无可加载广告");
      }
      return Future.value(false);
    }
    _stream = _provider?.insertAd(
      _code!,
      isFull,
      GTAdsCallBack(
        onShow: (code) {
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
        },
        onFail: (code, message) {
          if (callBack?.onFail != null) {
            callBack?.onFail!(code, message);
          }
          //移除当前错误code
          codes.remove(code);
          //重试 直至codes数组为空
          _loadAd();
          print("出错了$code $message", );
        },
        onExpand: (code, param) {
          if (callBack?.onExpand != null) {
            callBack?.onExpand!(code, param);
          }
        },
      ),
    );
    return Future.value(true);
  }
}

