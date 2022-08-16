
import 'gtads_csj_platform_interface.dart';

class GtadsCsj {
  Future<String?> getPlatformVersion() {
    return GtadsCsjPlatform.instance.getPlatformVersion();
  }
}
