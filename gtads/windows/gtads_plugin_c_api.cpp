#include "include/gtads/gtads_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "gtads_plugin.h"

void GtadsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  gtads::GtadsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
