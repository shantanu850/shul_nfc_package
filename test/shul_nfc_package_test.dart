import 'package:flutter_test/flutter_test.dart';
import 'package:shul_nfc_package/shul_nfc_package.dart';
import 'package:shul_nfc_package/shul_nfc_package_platform_interface.dart';
import 'package:shul_nfc_package/shul_nfc_package_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockShulNfcPackagePlatform
    with MockPlatformInterfaceMixin
    implements ShulNfcPackagePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ShulNfcPackagePlatform initialPlatform = ShulNfcPackagePlatform.instance;

  test('$MethodChannelShulNfcPackage is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelShulNfcPackage>());
  });

  test('getPlatformVersion', () async {
    ShulNfcPackage shulNfcPackagePlugin = ShulNfcPackage();
    MockShulNfcPackagePlatform fakePlatform = MockShulNfcPackagePlatform();
    ShulNfcPackagePlatform.instance = fakePlatform;

    expect(await shulNfcPackagePlugin.getPlatformVersion(), '42');
  });
}
