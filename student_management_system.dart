import 'dart:io';

class Student {
  String name;
  int rollNo;
  int total_subjects;
  List<String> Subjects;
  List<double> Marks;
  double percentage = 0.0;
  double total_marks = 0.0;
  double average = 0.0;
  List<Student> allStudents = [];

  Student({
    this.name = "",
    this.rollNo = 0,
    this.total_subjects = 0,
    this.Subjects = const [],
    this.Marks = const [],
    // this.percentage = 0.0,
    // this.total_marks = 0.0,
    // this.average = 0.0,
    // this.allStudents = const [],
  });
  void addStudent() {
    print("Enter the name of the Student: ");
    String? sname = stdin.readLineSync();
    print("Enter the Roll No of the Student: ");
    int? roll_no = int.parse(stdin.readLineSync()!);
    print("Enter the Total Subjects: ");
    int? tSubjects = int.parse(stdin.readLineSync()!);
    List<String> sub = [];
    List<double> mrk = [];
    for (int i = 0; i < tSubjects; i++) {
      print("Enter the name of the ${i + 1}th Subject: ");
      String? msub = stdin.readLineSync();
      print("Enter the marks of the ${i + 1}th Subject: ");
      double? m = double.parse(stdin.readLineSync()!);
      sub.add(msub!);
      mrk.add(m);
    }
    Student stu = Student(
      name: sname!,
      total_subjects: tSubjects,
      rollNo: roll_no,
      Subjects: sub,
      Marks: mrk,
    );
    allStudents.add(stu);
    print("\nStudent Added Successfully\n");
  }

  void calculatepercentage_averageandmarks() {
    print("\nEnter the ID/Roll no to calculate Percentage,Total Marks: ");
    int? id = int.parse(stdin.readLineSync()!);
    bool find = false;
    int idx = 0;
    for (int i = 0; i < allStudents.length; i++) {
      if (allStudents[i].rollNo == id) {
        idx = i;
        find = true;
        break;
      }
    }
    if (find == true) {
      for (int i = 0; i < Marks.length; i++) {
       allStudents[idx].total_marks += allStudents[idx].Marks[i];
      }
      allStudents[idx].percentage = (allStudents[idx].total_marks / (allStudents[idx].total_subjects * 100)) * 100.0;
      allStudents[idx].average = allStudents[idx].total_marks / allStudents[idx].total_subjects;
      print("Total Marks are: ${allStudents[idx].total_marks}");
      print("Average is: ${allStudents[idx].average}");
      print("Total Percentage is: ${allStudents[idx].percentage}\n");
    }

    if (find == false) {
      print("Wrong ID");
    }
  }

  void displayAllStudentsData() {
    for (int i = 0; i < allStudents.length; i++) {
      print("\nRecord of Student ${i + 1}th\n");
      print("\nStudent Name is ${allStudents[i].name}");
      print("Student Roll no is ${allStudents[i].rollNo}");
      print("Subject is: ${allStudents[i].Subjects}");
      print("Marks are: ${allStudents[i].Marks}\n");
      allStudents[i].calculatepercentage_averageandmarks();
    }
  }

  void searchStudentByRollNo() {
    print("\nEnter the Roll No to Find the Student Data: ");
    int? rno = int.parse(stdin.readLineSync()!);
    bool find = false;
    int? index;
    for (int i = 0; i < allStudents.length; i++) {
      if (rno == allStudents[i].rollNo) {
        index = i;
        print("Student with Roll no $rno found\n");
        find = true;
        break;
      }
    }
    if (find == true) {
      print("\nStudent Name is ${allStudents[index!].name}");
      print("Student Roll no is ${allStudents[index].rollNo}");
      print("Subject is: ${allStudents[index].Subjects}");
      print("Marks are: ${allStudents[index].Marks}\n");
      allStudents[index].calculatepercentage_averageandmarks();
    } else {
      print("Invalid or Wrong Roll no entered");
    }
  }

  void deleteStudent() {
    print("Enter the Roll No to Delete the Student Data: ");
    int? rno = int.parse(stdin.readLineSync()!);
    bool find = false;
    int? index;
    for (int i = 0; i < allStudents.length; i++) {
      if (rno == allStudents[i].rollNo) {
        index = i;
        print("Student with Roll no $rno found");
        allStudents.removeAt(index);
        find = true;
        print("\nStudent has been deleted successfully\n");
        break;
      }
    }
    if (find == false) {
      print("Student Not found or Wrong roll no entered");
    }
  }

  void updateMarks() {
    print("Enter the Roll No to Update the Student Marks: ");
    int? rno = int.parse(stdin.readLineSync()!);
    bool find = false;
    int? index;
    for (int i = 0; i < allStudents.length; i++) {
      if (rno == allStudents[i].rollNo) {
        index = i;
        print("\nStudent with Roll No $rno found\n");
        find = true;
        break;
      }
    }
    if (find == false) {
      print("\nRoll No not found\n");
      return;
    }
    for (int i = 0; i < allStudents[index!].total_subjects; i++) {
      print("\nEnter the Marks for ${allStudents[index].Subjects[i]}: ");
      double mrks = double.parse(stdin.readLineSync()!);
      allStudents[index].Marks[i] = mrks;
    }
    print("\nMarks Updated\n");
  }
}

void main() {
  Student stu = Student();
  while (true) {
    print("1. Add Student");
    print("2. Delete Student");
    print("3. Search Student by Roll No");
    print("4. Display Statistics of Student");
    print("5. Update Marks");
    print("6. Display all Students");
    print("7. Exit");
    print("\nPlease Select from the Menu");
    int? menu = int.parse(stdin.readLineSync()!);
    switch (menu) {
      case 1:
        stu.addStudent();
        break;
      case 2:
        stu.deleteStudent();
        break;
      case 3:
        stu.searchStudentByRollNo();
        break;
      case 4:
        stu.calculatepercentage_averageandmarks();
        break;
      case 5:
        stu.updateMarks();
        break;
      case 6:
        stu.displayAllStudentsData();
        break;
      case 7:
        print("program terminated by user");
        exit(0);
      default:
        print("Enter valid input");
        break;
    }
  }
}
