import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'dart_wallet_core_platform_platform_interface.dart';

/// An implementation of [DartWalletCorePlatformPlatform] that uses method channels.
class MethodChannelDartWalletCorePlatform extends DartWalletCorePlatformPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('dart_wallet_core_platform');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
