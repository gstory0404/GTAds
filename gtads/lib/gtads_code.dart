part of 'gtads.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/16 10:52
/// @Email gstory0404@gmail.com
/// @Description: 广告相关id
class GTAdsCode {
  late String appId;
  List<String>? nativeIds;
  List<String>? splashIds;
  List<String>? bannerIds;
  List<String>? insertIds;
  List<String>? rewardIds;

  GTAdsCode(
      {required this.appId,
        this.nativeIds,
        this.splashIds,
        this.bannerIds,
        this.insertIds,
        this.rewardIds});

  GTAdsCode.fromJson(Map<String, dynamic> json) {
    appId = json['appId'];
    nativeIds = json['nativeIds'].cast<String>();
    splashIds = json['splashIds'].cast<String>();
    bannerIds = json['bannerIds'].cast<String>();
    insertIds = json['insertIds'].cast<String>();
    rewardIds = json['rewardIds'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appId'] = appId;
    data['nativeIds'] = nativeIds;
    data['splashIds'] = splashIds;
    data['bannerIds'] = bannerIds;
    data['insertIds'] = insertIds;
    data['rewardIds'] = rewardIds;
    return data;
  }
}


