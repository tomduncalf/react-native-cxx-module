#import "TestCxxRCTModule.h"
#import "TestCxxModule.h"

@implementation TestCxxModule {
  ModuleRegistry* _moduleRegistry;
}

// Allow the moduleRegistry to be passed through
- initWithModuleRegistry: (ModuleRegistry*) moduleRegistry
{
  if (self = [super init]) {
    _moduleRegistry = moduleRegistry;
  }
  
  return self;
}

// Specify that the CxxNativeModule for this module should be setup immediately,
// rather than lazily when first accessed
+ (BOOL)requiresImmediateCxxNativeModuleSetup
{
  return YES;
}

- (std::unique_ptr<facebook::xplat::module::CxxModule>) createModule
{
    return std::make_unique<TestCxx::TestCxxModule>(_moduleRegistry);
}

@end
