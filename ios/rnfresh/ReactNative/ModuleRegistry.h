//
//  ModuleRegistry.h
//  rnfresh
//
//  Created by Tom Duncalf on 06/04/2018.
//

#ifndef ModuleRegistry_h
#define ModuleRegistry_h

// Forward declaration needed due to cyclical dependency
namespace TestCxx {
  class TestCxxModule;
}

#include "TestCxxModule.h"

// Class used to keep references to the instances of each RN CxxNativeModule used in the project
// This is required instead of the RN module registry so that we 1. get the correct instance
// (CxxNativeModule rather than CxxModule) and 2. can strongly type the modules
struct ModuleRegistry
{
  TestCxx::TestCxxModule* testModule;
};

#endif /* ModuleRegistry_h */
