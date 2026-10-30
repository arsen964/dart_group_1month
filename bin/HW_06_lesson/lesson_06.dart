import 'person.dart';
import 'student.dart';
import 'teacher.dart';
import 'subject.dart';

void main() {
  // Person
  Person person1 = Person('Adam White', 17, false);
  person1.introduce();

  print('--------------------');

  // Teacher
  Teacher teacher = Teacher('John Brown', 40, true, 10);

  teacher.introduce();

  print('--------------------');

  // First Student
  Student student1 = Student('John Smith', 17, false, {
    Subject.math: 90,
    Subject.physics: 85,
    Subject.english: 92,
  });

  student1.introduce();
  student1.showmarks();

  print('--------------------');

  // Second Student
  Student student2 = Student('Emily Johnson', 16, false, {
    Subject.math: 80,
    Subject.physics: 95,
    Subject.english: 90,
    Subject.history: 88,
  });

  student2.introduce();
  student2.showmarks();
}
