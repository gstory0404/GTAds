part of 'gtads.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/16 10:52
/// @Email gstory0404@gmail.com
/// @Description: 广告相关id
class GTAdsCode {
  String alias = "";
  String? androidId;
  String? ohosId;
  String? iosId;
  int probability = 0;

  GTAdsCode({required this.alias, this.androidId, this.iosId,this.ohosId,required this.probability});

  GTAdsCode.fromJson(Map<String, dynamic> json) {
    alias = json['alias'];
    androidId = json['androidId'];
    iosId = json['iosId'];
    ohosId = json['ohosId'];
    probability = json['probability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alias'] = this.alias;
    data['androidId'] = this.androidId;
    data['iosId'] = this.iosId;
    data['ohosId'] = this.ohosId;
    data['probability'] = this.probability;
    return data;
  }
}


