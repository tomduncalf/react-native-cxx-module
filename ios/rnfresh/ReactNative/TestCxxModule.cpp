#include "TestCxxModule.h"

#include <cxxreact/JsArgumentHelpers.h>
#include <cxxreact/Instance.h>

#include <folly/Memory.h>
#include <glog/logging.h>

#include <thread>
#include <iostream>

using namespace folly;
using namespace facebook::xplat;

namespace TestCxx {

std::string TestCxxModule::getName() {
  return "TestCxxModule";
}

auto TestCxxModule::getConstants() -> std::map<std::string, folly::dynamic> {
  return {
  };
}

auto TestCxxModule::getMethods() -> std::vector<Method> {
  return {
    Method("test", [this]{
        std::cout << "Hello from C++" << std::endl;
    }),
    Method("addListener", [this]{}),
    Method("removeListener", [this]{}),
  };
}

void TestCxxModule::emitEvent (dynamic eventData)
{
    auto reactInstance = this->getInstance().lock().get();
    reactInstance->callJSFunction("RCTDeviceEventEmitter", "emit", std::move(eventData));
}
    
void TestCxxModule::testJsEvent ()
{
    emitEvent (dynamic::array ("hello", "world"));
}
    
}

