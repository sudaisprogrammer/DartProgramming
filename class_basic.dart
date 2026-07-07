class Student {
  String? name;
  int? id;
  List<String>? courses;
  String? class_name;
  int? age;

  //constructor
  Student(this.name, this.id, this.courses, this.class_name, this.age) {}

  //method to display student data
  void display() {
    print("Name is ${this.name}");
    print("Age is ${this.age}");
    print("Department is ${this.class_name}");
    print("ID is ${this.id}");
    print("Courses are ${this.courses}");
  }
}

void main() {
  Student john = Student(
    "John",
    3221,
    ["C++", "DSA", "Discrete Math", "Modern Physics"],
    "Computer engineering",
    19,
  );
  john.display();
}
