import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'gtads_method_channel.dart';

abstract class GtadsPlatform extends PlatformInterface {
  /// Constructs a GtadsPlatform.
  GtadsPlatform() : super(token: _token);

  static final Object _token = Object();

  static GtadsPlatform _instance = MethodChannelGtads();

  /// The default instance of [GtadsPlatform] to use.
  ///
  /// Defaults to [MethodChannelGtads].
  static GtadsPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GtadsPlatform] when
  /// they register themselves.
  static set instance(GtadsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
