#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"

@interface AppDelegate()
  @property (nonatomic, strong) UINavigationController *navigationController;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
      FlutterViewController *controller = (FlutterViewController*)self.window.rootViewController;
      self.navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
      self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
      self.window.rootViewController = self.navigationController;
      [self.navigationController setNavigationBarHidden:YES animated:YES];
      [self.window makeKeyAndVisible];
   return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
