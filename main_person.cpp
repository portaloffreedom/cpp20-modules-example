#include "lsphelper.h"
IF_LSP(module;)
// include stdlib stuff needs to always come before import modules!
#include <iostream>
import data_type;

IF_LSP(export module main;)
using namespace data_type;

int main(int argc, char *argv[])
{
	std::cout << "----\n";
	std::cout << "---- printing person details with INTERNAL to class function\n\n";

	std::cout << "---- person created with single arg ctor\n";
	Person person{1};
	std::cout << "person age: " << person.getAge() << std::endl;
	person.printPerson();

	std::cout << "\n----\n";
	std::cout << "---- person created with 2 args ctor\n";
	Person person2{2,"test"};
	std::cout << "person2 age:  " << person2.getAge() << std::endl;
	std::cout << "person2 name: " << person2.getName() << std::endl;
	person2.printPerson();

	std::cout << "\n----\n";
	std::cout << "---- printing person details with EXTERNAL to class function\n\n";

	// person2.
	person2.printPerson();

	// print_person_external(person);
	// std::cout << "----\n";
	// print_person_external(person2);

	return 0;
}
