part of '../gtads.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/31 18:14
/// @Email gstory0404@gmail.com
/// @Description: 信息流广告

class GTAdsNativeWidget extends StatefulWidget {
  final List<GTAdsCode> codes;
  final double width;
  final double height;
  final int timeout;
  final String model;
  final GTAdsCallBack? callBack;

  /// 信息流广告
  ///
  /// [codes] 广告位
  ///
  /// [width] 宽
  ///
  /// [height] 高
  ///
  /// [timeout] 超时时间 当广告失败后会依次重试其他广告 直至所有广告均加载失败 设置超时时间可提前取消
  ///
  /// [model] 广告加载模式 [GTAdsModel.PRIORITY]优先级模式 [GTAdsModel.RANDOM]随机模式
  ///
  /// [callBack] 广告回调  [GTAdsCallBack]
  ///
  const GTAdsNativeWidget(
      {Key? key,
      required this.codes,
      required this.width,
      required this.height,
      required this.timeout,
      this.model = GTAdsModel.RANDOM,
      this.callBack})
      : super(key: key);

  @override
  State<GTAdsNativeWidget> createState() => _GTAdsNativeWidgetState();
}

class _GTAdsNativeWidgetState extends State<GTAdsNativeWidget> {
  //信息流广告
  Widget? _nativeWidget;

  //广告ids
  List<GTAdsCode> codes = [];

  //provider组
  List<GTAdsProvider> providers = [];

  //定时器
  Timer? _timer;

  @override
  void initState() {
    // super.initState();
    providers = GTAdsManager.instance.providers;
    codes.clear();
    codes.addAll(widget.codes);
    _startTime();
    print("banner广告位数量 ${codes.length} == ${widget.codes.length}");
    _getProvider();
  }

  //开始计时
  void _startTime() {
    _timer = Timer.periodic(Duration(seconds: widget.timeout), (timer) {
      if (mounted) {
        setState(() {
          _nativeWidget = null;
        });
      }
      if (widget.callBack?.onTimeout != null) {
        //获取广告超时
        widget.callBack?.onTimeout!();
      }
      _timer?.cancel();
    });
  }

  void _getProvider() {
    GTAdsProvider? provider;
    //如果不存在provider则返回一个空Container
    if (providers.length == 0) {
      _timer?.cancel();
      if (widget.callBack?.onEnd != null) {
        //暂无可加载广告
        widget.callBack?.onEnd!();
      }
      if (mounted) {
        setState(() {
          _nativeWidget = null;
        });
      }
      return;
    }
    //获取当前展示的广告位id
    var code = GTAdsUtil.getCode(widget.model, codes);
    //如果未获取到code 则直接返回
    if (code == null) {
      _timer?.cancel();
      if (widget.callBack?.onEnd != null) {
        //暂无可加载广告
        widget.callBack?.onEnd!();
      }
      if (mounted) {
        setState(() {
          _nativeWidget = null;
        });
      }
      return;
    }
    //循环获取provider
    for (var value in providers) {
      if (value.getAlias() == code.alias) {
        provider = value;
      }
    }
    //如果未查询到可使用provider 则重新加载
    if (provider == null) {
      codes.remove(code);
      _getProvider();
      return;
    }
    _nativeWidget = provider.nativeAd(
        code,
        widget.width,
        widget.height,
        GTAdsCallBack(
          onShow: (code) {
            //移除计时
            _timer?.cancel();
            if (widget.callBack?.onShow != null) {
              widget.callBack?.onShow!(code);
            }
          },
          onClick: (code) {
            if (widget.callBack?.onClick != null) {
              widget.callBack?.onClick!(code);
            }
          },
          onClose: (code) {
            if (widget.callBack?.onClose != null) {
              widget.callBack?.onClose!(code);
            }
          },
          onFail: (code, message) {
            if (widget.callBack?.onFail != null) {
              widget.callBack?.onFail!(code, message);
            }
            //移除当前错误code
            codes.remove(code);
            //重试 直至codes数组为空
            _getProvider();
          },
          onExpand: (code, param) {
            if (widget.callBack?.onExpand != null) {
              widget.callBack?.onExpand!(code, param);
            }
          },
        ));
    //广告不存在 则重试
    if (_nativeWidget == null) {
      //移除当前错误code
      codes.remove(code);
      //重试 直至codes数组为空
      _getProvider();
      return;
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _nativeWidget ?? Container();
  }
}
