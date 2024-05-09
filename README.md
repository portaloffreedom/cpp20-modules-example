# CPP20 modules example
Test/Template on how to work with modules in c++ (focusing mostly on cmake)

### To configure
- GCC:
```
cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -Bbuildgcc -GNinja
```
- CLANG: 
```
cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -Bbuild -GNinja -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++
```

### To compile
- GCC:
```
cmake --build buildgcc
```
- CLANG: 
```
cmake --build build
```

### LSP
You may want to configure clang in the `build` folder if you want clangd LSP to work correctly automatically
