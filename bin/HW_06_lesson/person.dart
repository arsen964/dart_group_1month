class Person {
  String fullName;
  int age;
  bool isMarried;

  Person(this.fullName, this.age, this.isMarried);

  void introduce() {
    print(
      'Hi! My name is $fullName. I am $age years old. Married: ${isMarried ? 'Yes' : 'No'}.',
    );
  }
}
