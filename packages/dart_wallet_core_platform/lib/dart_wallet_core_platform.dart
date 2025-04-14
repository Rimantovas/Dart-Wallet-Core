
import 'dart_wallet_core_platform_platform_interface.dart';

class DartWalletCorePlatform {
  Future<String?> getPlatformVersion() {
    return DartWalletCorePlatformPlatform.instance.getPlatformVersion();
  }
}
