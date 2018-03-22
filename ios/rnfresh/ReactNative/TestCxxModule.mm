#import "TestCxxRCTModule.h"
#import "TestCxxModule.h"

@implementation TestCxxModule

- (std::unique_ptr<facebook::xplat::module::CxxModule>) createModule
{
    return std::make_unique<TestCxx::TestCxxModule>();
}

@end
