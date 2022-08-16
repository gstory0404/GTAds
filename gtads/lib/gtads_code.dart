part of 'gtads.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/16 10:52
/// @Email gstory0404@gmail.com
/// @Description: 广告相关id
class GTAdsCode {
  late String appId;
  List<String>? nativeId;
  List<String>? splashId;
  List<String>? bannerId;
  List<String>? insertId;
  List<String>? rewardId;

  GTAdsCode(
      {required this.appId,
        this.nativeId,
        this.splashId,
        this.bannerId,
        this.insertId,
        this.rewardId});

  GTAdsCode.fromJson(Map<String, dynamic> json) {
    appId = json['appId'];
    nativeId = json['nativeId'].cast<String>();
    splashId = json['splashId'].cast<String>();
    bannerId = json['bannerId'].cast<String>();
    insertId = json['insertId'].cast<String>();
    rewardId = json['rewardId'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appId'] = appId;
    data['nativeId'] = nativeId;
    data['splashId'] = splashId;
    data['bannerId'] = bannerId;
    data['insertId'] = insertId;
    data['rewardId'] = rewardId;
    return data;
  }
}


