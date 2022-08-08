#ifndef FLUTTER_PLUGIN_EFFICIENT_INFRA_UI_PLUGIN_H_
#define FLUTTER_PLUGIN_EFFICIENT_INFRA_UI_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace efficient_infra_ui {

class EfficientInfraUiPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  EfficientInfraUiPlugin();

  virtual ~EfficientInfraUiPlugin();

  // Disallow copy and assign.
  EfficientInfraUiPlugin(const EfficientInfraUiPlugin&) = delete;
  EfficientInfraUiPlugin& operator=(const EfficientInfraUiPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace efficient_infra_ui

#endif  // FLUTTER_PLUGIN_EFFICIENT_INFRA_UI_PLUGIN_H_
