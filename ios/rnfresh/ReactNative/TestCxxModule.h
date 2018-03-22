#pragma once

#define FOLLY_NO_CONFIG

#include <memory>
#include <vector>

#include <cxxreact/CxxModule.h>

namespace TestCxx {
  
class TestCxxModule : public facebook::xplat::module::CxxModule {
public:
    TestCxxModule() {};

    std::string getName();

    virtual auto getConstants() -> std::map<std::string, folly::dynamic>;
    virtual auto getMethods() -> std::vector<Method>;

    void testJsEvent ();
    
private:    
    void emitEvent (folly::dynamic eventData);
};
    
}
