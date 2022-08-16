import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'gtads_csj_platform_interface.dart';

/// An implementation of [GtadsCsjPlatform] that uses method channels.
class MethodChannelGtadsCsj extends GtadsCsjPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('gtads_csj');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
