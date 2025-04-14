import 'package:flutter_test/flutter_test.dart';
import 'package:dart_wallet_core_platform/dart_wallet_core_platform.dart';
import 'package:dart_wallet_core_platform/dart_wallet_core_platform_platform_interface.dart';
import 'package:dart_wallet_core_platform/dart_wallet_core_platform_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDartWalletCorePlatformPlatform
    with MockPlatformInterfaceMixin
    implements DartWalletCorePlatformPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DartWalletCorePlatformPlatform initialPlatform = DartWalletCorePlatformPlatform.instance;

  test('$MethodChannelDartWalletCorePlatform is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDartWalletCorePlatform>());
  });

  test('getPlatformVersion', () async {
    DartWalletCorePlatform dartWalletCorePlatformPlugin = DartWalletCorePlatform();
    MockDartWalletCorePlatformPlatform fakePlatform = MockDartWalletCorePlatformPlatform();
    DartWalletCorePlatformPlatform.instance = fakePlatform;

    expect(await dartWalletCorePlatformPlugin.getPlatformVersion(), '42');
  });
}
