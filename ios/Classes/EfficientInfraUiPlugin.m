#import "EfficientInfraUiPlugin.h"
#if __has_include(<efficient_infra_ui/efficient_infra_ui-Swift.h>)
#import <efficient_infra_ui/efficient_infra_ui-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "efficient_infra_ui-Swift.h"
#endif

@implementation EfficientInfraUiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftEfficientInfraUiPlugin registerWithRegistrar:registrar];
}
@end
