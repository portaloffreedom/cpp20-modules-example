#include "lsphelper.h"
IF_LSP(module;)

// useless include, just for demonstrative purposes
// include stdlib stuff needs to always come before import modules!
#include <iostream>
import M2;
import M3;
IF_LSP(export module main;)
int main() {
	int ret = F2();
	F3();
	return ret;
}
