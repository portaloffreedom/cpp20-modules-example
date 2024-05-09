#pragma once

/*
 * LSP fails to parse `#include <iostream>` if not in modules, so we declare a
 * main module where necessary, but only for the LSP to parse correctly.
 *
 * Both GCC14 and CLANG17 seem to compile correctly without.
 */

#ifdef LSP_CLANGD
#define IF_LSP(a) a
#else
#define IF_LSP(a)
#endif
