/*
  ==============================================================================

    BridgeDelegate.cpp
    Created: 20 Mar 2018 12:53:20pm
    Author:  Tom Duncalf

  ==============================================================================
*/

#import "BridgeDelegate.h"

#import "TestCxxRCTModule.h"

@implementation BridgeDelegate

// This will return the location of our Bundle
- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
    NSURL *jsCodeLocation;

    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
    
    return jsCodeLocation;
}

- (NSArray *)extraModulesForBridge:(RCTBridge *)bridge
{
    return @[[[TestCxxModule alloc] init]];
}

@end
