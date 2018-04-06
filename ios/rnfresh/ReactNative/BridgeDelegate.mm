#import "BridgeDelegate.h"

#import "TestCxxRCTModule.h"

@implementation BridgeDelegate {
  ModuleRegistry* _moduleRegistry;
}

- initWithModuleRegistry: (ModuleRegistry*) moduleRegistry
{
  if (self = [super init]) {
    _moduleRegistry = moduleRegistry;
  }

  return self;
}

// This will return the location of our Bundle
- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
    NSURL *jsCodeLocation;

    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
    
    return jsCodeLocation;
}

// Initialise our RCTCxxModule, passing in the module registry so we can keep a reference to
// the CxxNativeModule once it is initialised
- (NSArray *)extraModulesForBridge:(RCTBridge *)bridge
{
    return @[[[TestCxxModule alloc] initWithModuleRegistry: _moduleRegistry]];
}

@end
