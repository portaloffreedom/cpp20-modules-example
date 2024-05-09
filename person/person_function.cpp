module;
// include stdlib stuff needs to always come before import modules!
#include <iostream>
import data_type_person;

export module data_type_extra;

namespace data_type
{
	export void print_person_external(Person &person)
	{
		std::cout << "Person name is: " << person.getName() << std::endl;
		std::cout << "Person age is:  " << person.getAge()  << std::endl;
	};
}
