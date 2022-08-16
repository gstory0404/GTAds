import 'package:flutter_test/flutter_test.dart';
import 'package:gtads/gtads.dart';
import 'package:gtads/gtads_platform_interface.dart';
import 'package:gtads/gtads_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGtadsPlatform 
    with MockPlatformInterfaceMixin
    implements GtadsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GtadsPlatform initialPlatform = GtadsPlatform.instance;

  test('$MethodChannelGtads is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGtads>());
  });

  test('getPlatformVersion', () async {
    Gtads gtadsPlugin = Gtads();
    MockGtadsPlatform fakePlatform = MockGtadsPlatform();
    GtadsPlatform.instance = fakePlatform;
  
    expect(await gtadsPlugin.getPlatformVersion(), '42');
  });
}
