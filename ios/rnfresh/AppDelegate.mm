/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"

#import "ReactNative/TestCxxRCTModule.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  id<RCTBridgeDelegate> moduleInitialiser = [[BridgeDelegate alloc] init];
  
  RCTBridge* bridge = [[RCTBridge alloc] initWithDelegate: moduleInitialiser launchOptions: launchOptions];
  
  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
                                                   moduleName:@"TestCxx"
                                            initialProperties:nil];
  
  TestCxxModule* module = [bridge moduleForName:@"TestCxxModule"];
  // 1. Is there a better way to cause the module to lazily initialize itself before I want to use it?
  [module methodsToExport];
  
  // 2. `module` now contains the TestCxxModule Obj-C wrapper, but how do I get the actual C++ module it wraps?
  // Should I just keep my own reference to it inside my wrapper, or is there a proper way to do get it?
  
  // 3. Even if I can access the actual C++ module inside, its instance_ property is null (put a breakpoint here to see)
  // - is this correct? If so, how can I access a React Native instance to callback to JS from C++?

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  return YES;
}

@end
