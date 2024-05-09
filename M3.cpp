module;
// include stdlib stuff needs to always come before import modules!
#include <iostream>
export module M3;
export void F3() {
	std::cerr << "ok" << std::endl;
}
