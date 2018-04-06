/**
 * Required Objective C wrapper class for CxxNativeModule
 */

#pragma one

#import <CxxModule/RCTCxxModule.h>

#import "ModuleRegistry.h"

@interface TestCxxModule : RCTCxxModule

- initWithModuleRegistry: (ModuleRegistry*) moduleRegistry;

@end

