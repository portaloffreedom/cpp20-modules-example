all: person_gcc_exe exe-clang exe-gcc

###### CLANG ##################################################################
exe-clang: main-clang.o M2-clang.pcm M3-clang.pcm
	clang++ -std=c++20 M2-clang.pcm M3-clang.pcm main-clang.o -o exe-clang

M2-clang.pcm: M2.cpp
	clang++ M2.cpp -std=c++20 -c -o M2-clang.pcm -Xclang -emit-module-interface

M3-clang.pcm: M3.cpp
	clang++ M3.cpp -std=c++20 -c -o M3-clang.pcm -Xclang -emit-module-interface

main-clang.o: main.cpp M2-clang.pcm M3-clang.pcm
	clang++ main.cpp -std=c++20 -c -o main-clang.o -fmodule-file=M2=M2-clang.pcm -fmodule-file=M3=M3-clang.pcm

###### GCC ####################################################################
exe-gcc: main-gcc.o M2-gcc.o M3-gcc.o gcm.cache/usr/include/c++/11/iostream.gcm
	g++ -std=c++20 M2-gcc.o M3-gcc.o main-gcc.o -o exe-gcc

M2-gcc.o: M2.cpp
	g++ M2.cpp -std=c++20 -c -o M2-gcc.o -fmodules-ts 

M3-gcc.o: M3.cpp
	g++ M3.cpp -std=c++20 -c -o M3-gcc.o -fmodules-ts 

main-gcc.o: main.cpp M2-gcc.o M3-gcc.o
	g++ main.cpp -std=c++20 -c -o main-gcc.o -fmodules-ts

gcm.cache/usr/include/c++/11/iostream.gcm:
	g++ -std=c++20 -fmodules-ts -c -x c++-system-header iostream

###### ONE LINE GCC ###########################################################
person_gcc_exe: gcm.cache/usr/include/c++/11/iostream.gcm
	g++ -std=c++20 -fmodules-ts -o person_gcc_exe person_module.cpp person.cpp person_function.cpp main_person.cpp

###### OTHER ##################################################################
.PHONY: clean all

clean:
	rm -rf *.o *.pcm exe-* gcm.cache person_gcc_exe

