#import "CommonLibraryPlugin.h"
#if __has_include(<inspireui_package/inspireui_package-Swift.h>)
#import <inspireui_package/inspireui_package-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "inspireui_package-Swift.h"
#endif

@implementation CommonLibraryPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCommonLibraryPlugin registerWithRegistrar:registrar];
}
@end