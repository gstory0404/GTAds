import 'package:flutter_test/flutter_test.dart';
import 'package:gtads_csj/gtads_csj.dart';
import 'package:gtads_csj/gtads_csj_platform_interface.dart';
import 'package:gtads_csj/gtads_csj_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGtadsCsjPlatform 
    with MockPlatformInterfaceMixin
    implements GtadsCsjPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GtadsCsjPlatform initialPlatform = GtadsCsjPlatform.instance;

  test('$MethodChannelGtadsCsj is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGtadsCsj>());
  });

  test('getPlatformVersion', () async {
    GtadsCsj gtadsCsjPlugin = GtadsCsj();
    MockGtadsCsjPlatform fakePlatform = MockGtadsCsjPlatform();
    GtadsCsjPlatform.instance = fakePlatform;
  
    expect(await gtadsCsjPlugin.getPlatformVersion(), '42');
  });
}
