//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <bitsdojo_window_windows/bitsdojo_window_plugin.h>
#include <efficient_infra_ui/efficient_infra_ui_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  BitsdojoWindowPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("BitsdojoWindowPlugin"));
  EfficientInfraUiPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("EfficientInfraUiPluginCApi"));
}
