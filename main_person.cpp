import data_type;
import <iostream>;

using namespace data_type;
using namespace std;

int main(int argc, char *argv[])
{
	cout << "----\n";
	cout << "---- printing person details with INTERNAL to class function\n\n";

	cout << "---- person created with single arg ctor\n";
	Person person{1};
	cout << "person age: " << person.getAge() << endl;
	person.printPerson();

	cout << "\n----\n";
	cout << "---- person created with 2 args ctor\n";
	Person person2{2,"test"};
	cout << "person2 age:  " << person2.getAge() << endl;
	cout << "person2 name: " << person2.getName() << endl;
	person2.printPerson();

	cout << "\n----\n";
	cout << "---- printing person details with EXTERNAL to class function\n\n";

	print_person_external(person);
	cout << "----\n";
	print_person_external(person2);

	return 0;
}
