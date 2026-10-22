import 'dart:io';

void main() {
  int temperature = 19;
  int numberOfStudents = 10;
  bool isRainy = false;

  if (temperature > 15) {
    String parkTitle = 'Central Park';
    print('Go walking to $parkTitle');
  }

  if (numberOfStudents == 22) {
    print('Play Football');
  }

  if (isRainy) {
    print('Take an umbrella');
  } else {
    print('Take on a hat');
  }

  if (numberOfStudents > 5) {
    print('Play bowling');
  } else {
    print('Go to school');
  }

  // temperature = temperature - 20;
  if (temperature > 30) {
    print('The weather is hot');
  } else if (temperature > 20) {
    print('The weather is warm');
  } else if (temperature > 10) {
    print('The weather is cool');
  } else if (temperature > 0) {
    print('The weather is cold');
  } else {
    print('The weather is freezing');
  }

  // else {
  //   print('Do something');
  // }

  numberOfStudents = numberOfStudents + 10;
  if (numberOfStudents > 15) {
    print('Go to picnic');
    if (temperature > 25) {
      // вложенная условная конструкция
      print('Eat an ice-cream');
    } else {
      print('Drink a hot tea');
    }
  }

  int number = -1;
  switch (number) {
    case 1:
    case -1:
      print('Number equals to one.');
      print('Or number equals to minus one.');
    case 2:
      print('Number equals to two.');
    case 3:
      print('Number equals to three.');
    default:
      print('The number is unknown.');
  }

  numberOfStudents < 5 ? print('Go to restaraunt') : print('Go to cafe');

  if (numberOfStudents < 5) {
    print('Go to restaraunt');
  } else {
    print('Go to cafe');
  }

  if (temperature > 10 && numberOfStudents > 5) {
    // Оператор AND (&&) - истина, если оба условия истинны
    print('Go to GEEKS');
  }

  if (isRainy && temperature < 20) {
    print('Play Tennis');
  }

  isRainy = true;
  if (isRainy || temperature < 10) {
    // Оператор OR (||) - истина, если хотя бы одно условие истинно
    print('Go to work');
  }

  if (temperature == 26 || temperature == 29) {
    print('Go swimming');
  }

  if (temperature > 20 && temperature < 40 ||
      numberOfStudents > 5 && numberOfStudents < 30 ||
      isRainy) {
    // false && true || true && true || true => 0 * 1 + 1 * 1 + 1 = 0 + 1 + 1 = 1 (true)
    print('Go shopping');
  }

  if (temperature > 20 &&
      (temperature < 40 || numberOfStudents > 5) &&
      (numberOfStudents < 30 || isRainy)) {
    // false && (true || true) && (true || true) => 0 * (1 + 1) * (1 + 1) = 0 * 1 * 1 = 0 (false)
    print('Go boxing');
  }

  isRainy = false;
  // if (isRainy) {
  // } else {
  //   print('Go to market');
  // }

  if (!isRainy) {
    // Оператор NOT - инвертирует значение булева выражения
    print('Go to market');
  }

  String myNum = '30';
  print(myNum + myNum);
  print(int.parse(myNum) + int.parse(myNum));
  print(double.parse(myNum) + double.parse(myNum));

  int digit = 5;
  print(digit.toString() + digit.toString());

  print('What is your name? ');
  String name = stdin.readLineSync()!;
  print('Nice to meet you $name');

  print('Enter first number:');
  int num1 = int.parse(stdin.readLineSync()!);

  print('Enter second number:');
  int num2 = int.parse(stdin.readLineSync()!);

  print('Product of numbers: ${num1 * num2}');

  print('Enter a sign: +, -, *, or /:');
  final String sign = stdin.readLineSync()!;
  switch (sign) {
    case '+':
      print('Result: ${num1 + num2}');
      break;
    case '-':
      print('Result: ${num1 - num2}');
      break;
    case '*':
      print('Result: ${num1 * num2}');
      break;
    case '/':
      print('Result: ${num1 / num2}');
      break;
    default:
      print('Invalid sign entered.');
  }
  
  print('End of program');
}
