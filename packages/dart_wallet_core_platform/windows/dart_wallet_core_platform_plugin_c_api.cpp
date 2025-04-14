#include "include/dart_wallet_core_platform/dart_wallet_core_platform_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "dart_wallet_core_platform_plugin.h"

void DartWalletCorePlatformPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  dart_wallet_core_platform::DartWalletCorePlatformPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
