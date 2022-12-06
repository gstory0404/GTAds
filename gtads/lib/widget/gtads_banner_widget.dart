part of '../gtads.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/31 18:14
/// @Email gstory0404@gmail.com
/// @Description: 横幅广告

class GTAdsBannerWidget extends StatefulWidget {
  final List<GTAdsCode> codes;
  final double width;
  final double height;
  final int timeout;
  final String model;
  final GTAdsCallBack? callBack;

  /// 横幅广告
  ///
  /// [codes] 广告位
  ///
  /// [width] 宽
  ///
  /// [height] 高
  ///
  /// [timeout] 超时时间 当广告失败后会依次重试其他广告 直至所有广告均加载失败 设置超时时间可提前取消
  ///
  ///  [model] 广告加载模式 [GTAdsModel.PRIORITY]优先级模式 [GTAdsModel.RANDOM]随机模式
  ///
  /// [callBack] 广告回调  [GTAdsCallBack]
  ///
  const GTAdsBannerWidget(
      {Key? key,
      required this.codes,
      required this.width,
      required this.height,
      required this.timeout,
      this.model = GTAdsModel.RANDOM,
      this.callBack})
      : super(key: key);

  @override
  State<GTAdsBannerWidget> createState() => _GTAdsBannerWidgetState();
}

class _GTAdsBannerWidgetState extends State<GTAdsBannerWidget> {
  //banner广告
  Widget? _bannerWidget;

  //广告ids
  List<GTAdsCode> codes = [];

  //provider组
  List<GTAdsProvider> providers = [];

  //广告id
  GTAdsCode? code;

  //定时器
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    providers = GTAdsManager.instance.providers;
    codes = widget.codes;
    startTime();
    getProvider();
  }

  //开始计时
  void startTime() {
    _timer = Timer.periodic(Duration(seconds: widget.timeout), (timer) {
      if (mounted) {
        setState(() {
          _bannerWidget = null;
        });
      }
      if (widget.callBack?.onTimeout != null) {
        //获取广告超时
        widget.callBack?.onTimeout!();
      }
      _timer?.cancel();
    });
  }

  void getProvider() {
    print("codes数量===>${codes.length}");
    GTAdsProvider? provider;
    //如果不存在provider则返回一个空Container
    if (providers.length == 0) {
      _timer?.cancel();
      if (widget.callBack?.onEnd != null) {
        //暂无可加载广告
        widget.callBack?.onEnd!();
      }
      return;
    }
    code = GTAdsUtil.getCode(widget.model, codes);
    //如果未获取到code 则直接返回
    if (code == null) {
      _timer?.cancel();
      if (widget.callBack?.onEnd != null) {
        //暂无可加载广告
        widget.callBack?.onEnd!();
      }
      return;
    }
    //循环获取provider
    for (var value in providers) {
      if (value.getAlias() == code?.alias) {
        provider = value;
      }
    }
    //如果未查询到可使用provider 则直接返回
    if (provider == null) {
      _timer?.cancel();
      if (widget.callBack?.onEnd != null) {
        //暂无可加载广告
        widget.callBack?.onEnd!();
      }
      return;
    }
    _bannerWidget = provider.bannerAd(
        code!,
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
            getProvider();
          },
          onExpand: (code, param) {
            if (widget.callBack?.onExpand != null) {
              widget.callBack?.onExpand!(code, param);
            }
          },
        ));
    //广告不存在 则重试
    if (_bannerWidget == null) {
      //移除当前错误code
      codes.remove(code);
      //重试 直至codes数组为空
      getProvider();
      return;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _bannerWidget ?? Container();
  }
}
