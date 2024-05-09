module;
// include stdlib stuff needs to always come before import modules!
#include <iostream>
export module M2;
export int F2() { std::cout << "test\n"; return 42;}
