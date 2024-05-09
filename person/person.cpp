module;
// include stdlib stuff needs to always come before import modules!
#include <iostream>

export module data_type_person;

export namespace data_type
{
	class Person {
	private:
		int m_age;
		std::string_view const m_name;

	public:
		Person(int age, std::string_view const &name)
			: m_age{age}, m_name{name} {};
		Person(int age)
			: m_age{age}, m_name{"default"} {};

		void printPerson()
		{
			std::cout << "Person name is: " << m_name << std::endl;
			std::cout << "Person age is   " << m_age << std::endl;
		}

		int getAge()
		{
			return m_age;
		}

		std::string_view const& getName()
		{
			return m_name;
		}
	};
}
