/**
 * Custom RCTBridgeDelegate to allow us to initialise our CxxModule as an "extra module"
 */

#import <React/RCTBridgeDelegate.h>
#import <React/RCTBundleURLProvider.h>

#import "ModuleRegistry.h"

@interface BridgeDelegate : NSObject<RCTBridgeDelegate>

- initWithModuleRegistry: (ModuleRegistry*) moduleRegistry;

@end


