#import "ShulNfcPackagePlugin.h"
#if __has_include(<shul_nfc_package/shul_nfc_package-Swift.h>)
#import <shul_nfc_package/shul_nfc_package-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "shul_nfc_package-Swift.h"
#endif

@implementation ShulNfcPackagePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftShulNfcPackagePlugin registerWithRegistrar:registrar];
}
@end
