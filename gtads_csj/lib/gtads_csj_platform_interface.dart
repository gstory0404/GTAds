import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'gtads_csj_method_channel.dart';

abstract class GtadsCsjPlatform extends PlatformInterface {
  /// Constructs a GtadsCsjPlatform.
  GtadsCsjPlatform() : super(token: _token);

  static final Object _token = Object();

  static GtadsCsjPlatform _instance = MethodChannelGtadsCsj();

  /// The default instance of [GtadsCsjPlatform] to use.
  ///
  /// Defaults to [MethodChannelGtadsCsj].
  static GtadsCsjPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GtadsCsjPlatform] when
  /// they register themselves.
  static set instance(GtadsCsjPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
