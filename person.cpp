module;
import <iostream>;

module data_type;

namespace data_type
{
	Person::Person(int age, std::string_view const &name) : m_age{age}, m_name{name} {};
	Person::Person(int age) : m_age{age}, m_name{"default"} {};

	void Person::printPerson()
	{
		std::cout << "Person name is: " << m_name << std::endl;
		std::cout << "Person age is   " << m_age << std::endl;
	}

	int Person::getAge()
	{
		return m_age;
	}

	std::string_view const &Person::getName()
	{
		return m_name;
	}
}
