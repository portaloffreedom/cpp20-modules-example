module;
import <iostream>;

export module data_type;

export namespace data_type
{
	class Person
	{
	private:
		int m_age;
		std::string_view const m_name;

	public:
		Person(int age, std::string_view const &name);
		Person(int age);
		void printPerson();

		int getAge();
		std::string_view const &getName();
	};

	void print_person_external(Person &person);
}
