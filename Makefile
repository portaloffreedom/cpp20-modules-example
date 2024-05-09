all: person_gcc_exe exe-clang exe-gcc person_gcc_oneline_exe

GCCVERSION = $(shell gcc --version | grep ^gcc | sed 's/^.* //g')
GCCVERSION = $(shell gcc --version | head -n1 | sed 's/gcc (GCC) \([0-9\.]*\) .*$$/\1/g')
G++VERSION = $(shell g++ --version | head -n1 | sed 's/g++ (GCC) \([0-9\.]*\) .*$$/\1/g')

system-headers: gcm.cache/usr/include/c++/${G++VERSION}/iostream.gcm

gcm.cache/usr/include/c++/${G++VERSION}/iostream.gcm:
	@echo gcm.cache/usr/include/c++/${G++VERSION}/iostream.gcm
	g++ -std=gnu++20 -fmodules-ts -c -x c++-system-header iostream

gcm.cache/usr/include/c++/${G++VERSION}/string.gcm:
	@echo gcm.cache/usr/include/c++/${G++VERSION}/string.gcm
	g++ -std=gnu++20 -fmodules-ts -c -x c++-system-header string

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
exe-gcc: main-gcc.o M2-gcc.o M3-gcc.o system-headers
	g++ -std=gnu++20 M2-gcc.o M3-gcc.o main-gcc.o -o exe-gcc

M2-gcc.o: M2.cpp
	g++ M2.cpp -std=gnu++20 -c -o M2-gcc.o -fmodules-ts

M3-gcc.o: M3.cpp
	g++ M3.cpp -std=gnu++20 -c -o M3-gcc.o -fmodules-ts

main-gcc.o: main.cpp M2-gcc.o M3-gcc.o
	g++ main.cpp -std=gnu++20 -c -o main-gcc.o -fmodules-ts

###### GCC ###########################################################
person/module.o: person/person.o person/person_function.o system-headers
	g++ -g -std=gnu++20 -fmodules-ts -c -o person/module.o -x c++ person/module.cppm
person/person.o: system-headers
	g++ -g -std=gnu++20 -fmodules-ts -c -o person/person.o person/person.cpp
person/person_function.o: system-headers
	g++ -g -std=gnu++20 -fmodules-ts -c -o person/person_function.o person/person_function.cpp

person_gcc_exe: system-headers person/module.o person/person.o person/person_function.o
	g++ -g -std=gnu++20 -fmodules-ts -o person_gcc_exe person/module.o person/person.o person/person_function.o main_person.cpp

###### ONE LINE GCC ###########################################################
person_gcc_oneline_exe: system-headers
	g++ -std=gnu++20 -fmodules-ts -o person_gcc_oneline_exe -x c++ person/module.cppm person/person.cpp person/person_function.cpp main_person.cpp

###### OTHER ##################################################################
.PHONY: clean all system-headers

clean:
	rm -rf *.o *.pcm exe-* gcm.cache person_gcc_exe person_gcc_oneline_exe person/*.o *.a
	rm -rf .sconsign.dblite

