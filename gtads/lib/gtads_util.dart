import 'dart:math';

import 'package:gtads/gtads.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/31 18:18
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述

class GTAdsUtil {
  static GTAdsCode? getCode(String mode, List<GTAdsCode> codes) {
    if (mode == GTAdsModel.RANDOM) {
      return randomCode(codes);
    } else if (mode == GTAdsModel.PRIORITY) {
      return priorityCode(codes);
    } else {
      return null;
    }
  }

  //获取优先级高的广告组件
  static GTAdsCode? priorityCode(List<GTAdsCode> codes) {
    if (codes.length == 0) {
      return null;
    }
    GTAdsCode code = codes[0];
    codes.forEach((element) {
      if (code.probability < element.probability) {
        code = element;
      }
    });
    return code;
  }

  //获取随机广告组件
  static GTAdsCode? randomCode(List<GTAdsCode> codes) {
    //最大数因子
    int max = 0;
    codes.forEach((element) {
      //过滤概率小于1的广告
      if (element.probability > 0) {
        max += element.probability;
      }
    });
    if (max == 0) {
      return null;
    }
    int probability = Random().nextInt(max) + 1;
    int current = 0;
    for (int i = 0; i < codes.length; i++) {
      //过滤概率小于1的广告
      if (codes[i].probability > 0) {
        if (current < probability &&
            probability <= current + codes[i].probability) {
          return codes[i];
        } else {
          current += codes[i].probability;
        }
      }
    }
    return null;
  }
}
