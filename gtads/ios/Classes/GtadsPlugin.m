#import "GtadsPlugin.h"
#if __has_include(<gtads/gtads-Swift.h>)
#import <gtads/gtads-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "gtads-Swift.h"
#endif

@implementation GtadsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftGtadsPlugin registerWithRegistrar:registrar];
}
@end
