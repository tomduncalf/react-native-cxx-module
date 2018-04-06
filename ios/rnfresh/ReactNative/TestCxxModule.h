/**
 * An example CxxModule, based on the React Natice SampleCxxModule.cpp.
 *
 * Demonstrates calling in to the module from JS, and emitting events back to JS, from C++.
 */

#pragma once

#define FOLLY_NO_CONFIG

#include <memory>
#include <vector>

#include <cxxreact/CxxModule.h>

// Forward declaration needed due to cyclical dependency
class ModuleRegistry;

#include "ModuleRegistry.h"

namespace TestCxx {
  
class TestCxxModule : public facebook::xplat::module::CxxModule {
public:
    TestCxxModule (ModuleRegistry* m);

    std::string getName();

    virtual auto getConstants() -> std::map<std::string, folly::dynamic>;
    virtual auto getMethods() -> std::vector<Method>;

    void testJsEvent ();
    
private:    
    void emitEvent (folly::dynamic eventData);
};
    
}
