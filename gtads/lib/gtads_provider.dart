part of 'gtads.dart';

/// @Author: gstory
/// @CreateDate: 2022/8/16 10:27
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述 

abstract class GTAdsProvider extends BaseProvider {

  ///[alias] 广告别名 注意：保证唯一，不然无法添加
  ///
  ///[androidId] android appId
  ///
  ///[adsCode] ios appId
  GTAdsProvider(String alias, String? androidId, String? iosId)
      :
        assert(alias.isNotEmpty),
        super(alias, androidId, iosId);

  String getAlias() {
    return this.alias;
  }
}


