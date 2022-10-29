import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shul_nfc_package/shul_nfc_package_method_channel.dart';

void main() {
  MethodChannelShulNfcPackage platform = MethodChannelShulNfcPackage();
  const MethodChannel channel = MethodChannel('shul_nfc_package');

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
