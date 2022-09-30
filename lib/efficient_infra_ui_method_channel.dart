import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'efficient_infra_ui_platform_interface.dart';

/// An implementation of [EfficientInfraUiPlatform] that uses method channels.
class MethodChannelEfficientInfraUi extends EfficientInfraUiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('efficient_infra_ui');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
