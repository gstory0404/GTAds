part of 'gtads.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/17 14:58
/// @Email gstory0404@gmail.com
/// @Description: 聚合广告回调

///显示
typedef GTAShow = void Function(String alias, String codeId);

///失败
///
///[message] 错误信息
typedef GTAFail = void Function(String alias, String codeId, String message);

///点击
typedef GTAClick = void Function(String alias, String codeId);

///倒计时结束
typedef GTAFinish = void Function(String alias, String codeId);

///关闭
typedef GTAClose = void Function(String alias, String codeId);

///激励广告广告奖励验证
///
/// [verify] 是否有效
///
/// [transId] 验证id
///
/// [rewardName] 奖励名称
///
/// [rewardAmount] 奖励数量
typedef GTAVerify = void Function(String alias, String codeId, bool verify,
    String transId, String rewardName, int rewardAmount);

///扩展接口
typedef GTAExpand = void Function(String alias, String codeId, dynamic param);

///聚合广告接口回调
class GTAdsCallBack {
  GTAShow? onShow;
  GTAFail? onFail;
  GTAClick? onClick;
  GTAFinish? onFinish;
  GTAVerify? onVerify;
  GTAClose? onClose;
  GTAExpand? onExpand;

  GTAdsCallBack(
      {this.onShow,
      this.onFail,
      this.onClick,
      this.onFinish,
      this.onVerify,
      this.onClose,
      this.onExpand});
}
