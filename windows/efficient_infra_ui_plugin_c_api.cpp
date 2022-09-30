#include "include/efficient_infra_ui/efficient_infra_ui_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "efficient_infra_ui_plugin.h"

void EfficientInfraUiPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  efficient_infra_ui::EfficientInfraUiPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
