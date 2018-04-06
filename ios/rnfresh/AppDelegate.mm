/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"

#import "ReactNative/ModuleRegistry.h"
#import "ReactNative/TestCxxRCTModule.h"

@implementation AppDelegate {
  ModuleRegistry* moduleRegistry;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // Create a module registry to keep a reference to the CxxNativeModule, which we will pass
  // through to the relevant places. Could equally make this a singleton.
  moduleRegistry = new ModuleRegistry();

  id<RCTBridgeDelegate> moduleInitialiser = [[BridgeDelegate alloc] initWithModuleRegistry: moduleRegistry];  
  
  RCTBridge* bridge = [[RCTBridge alloc] initWithDelegate: moduleInitialiser launchOptions: launchOptions];
  
  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
                                                   moduleName:@"TestCxx"
                                            initialProperties:nil];
  
  // Make a call to the module to emit an event to JS. Needs a small delay otherwise the module
  // is not properly initialised.
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
    moduleRegistry->testModule->testJsEvent();
  });

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  return YES;
}

@end
