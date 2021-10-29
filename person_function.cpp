module;
import <iostream>;

module data_type;

namespace data_type
{
	void print_person_external(Person &person)
	{
		std::cout << "Person name is: " << person.getName() << std::endl;
		std::cout << "Person age is:  " << person.getAge()  << std::endl;
	};
}
