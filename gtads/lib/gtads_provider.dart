part of 'gtads.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/16 10:27
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述 

abstract class GTAdsProvider extends BaseProvider {

  ///[alias] 广告别名 必须设置 注意：保证唯一，不然无法添加
  ///
  ///[probability] 广告出现概率 必须设置 0 - 10(0不出现)
  ///
  ///[adsCode] 广告id 必须设置
  GTAdsProvider(String alias, int probability, GTAdsCode adsCode)
      :
        assert(alias.isNotEmpty),
        assert(probability >= 0 && probability <= 10),
        assert(adsCode.appId.isNotEmpty),
        super(alias, probability, adsCode);

  String getAlias() {
    return this.alias;
  }

  GTAdsCode getGTAdsCode() {
    return this.adsCode;
  }

  int getProbability() {
    return this.probability;
  }
}


