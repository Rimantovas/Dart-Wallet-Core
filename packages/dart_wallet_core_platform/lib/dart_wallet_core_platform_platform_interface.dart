import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'dart_wallet_core_platform_method_channel.dart';

abstract class DartWalletCorePlatformPlatform extends PlatformInterface {
  /// Constructs a DartWalletCorePlatformPlatform.
  DartWalletCorePlatformPlatform() : super(token: _token);

  static final Object _token = Object();

  static DartWalletCorePlatformPlatform _instance = MethodChannelDartWalletCorePlatform();

  /// The default instance of [DartWalletCorePlatformPlatform] to use.
  ///
  /// Defaults to [MethodChannelDartWalletCorePlatform].
  static DartWalletCorePlatformPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DartWalletCorePlatformPlatform] when
  /// they register themselves.
  static set instance(DartWalletCorePlatformPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
