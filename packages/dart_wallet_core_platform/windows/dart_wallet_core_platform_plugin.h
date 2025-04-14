#ifndef FLUTTER_PLUGIN_DART_WALLET_CORE_PLATFORM_PLUGIN_H_
#define FLUTTER_PLUGIN_DART_WALLET_CORE_PLATFORM_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace dart_wallet_core_platform {

class DartWalletCorePlatformPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  DartWalletCorePlatformPlugin();

  virtual ~DartWalletCorePlatformPlugin();

  // Disallow copy and assign.
  DartWalletCorePlatformPlugin(const DartWalletCorePlatformPlugin&) = delete;
  DartWalletCorePlatformPlugin& operator=(const DartWalletCorePlatformPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace dart_wallet_core_platform

#endif  // FLUTTER_PLUGIN_DART_WALLET_CORE_PLATFORM_PLUGIN_H_
