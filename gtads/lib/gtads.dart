
import 'gtads_platform_interface.dart';

class Gtads {
  Future<String?> getPlatformVersion() {
    return GtadsPlatform.instance.getPlatformVersion();
  }
}
