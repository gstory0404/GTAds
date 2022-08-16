import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gtads_csj/gtads_csj_method_channel.dart';

void main() {
  MethodChannelGtadsCsj platform = MethodChannelGtadsCsj();
  const MethodChannel channel = MethodChannel('gtads_csj');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
