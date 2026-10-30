import 'dart:io';


void main() {
  print('Start of program');
  for (int i = 1; i <= 5; i = i + 1) {
    print('Step $i');
  }

  print('--------------------');
  int number = 7;
  for (int i = 1; i <= 10; i++) // i = i + 1 => i++  (increment)
  {
    print('$number x $i = ${number * i}');
  }

  print('--------------------');
  number = 5;
  for (int i = 10; i >= 1; i--) // i = i - 1 => i--  (decrement)
  {
    print('$number x $i = ${number * i}');
  }

  print('--------------------');
  number = 9;
  for (int i = 10; i >= 2; i -= 2) // i = i - 2 => i-=2
  {
    print('$number x $i = ${number * i}');
  }

  print('------------------');
  int count = 0;
  while (count <= 3) {
    print('Count is $count');
    count++;
    print('Square is ${count * count}');
  }

  String myStr = '#';
  while (myStr.length < 5) {
    print(myStr);
    myStr = myStr + '#';
  }

  int doCount = 0;
  do {
    print('Do-While count is $doCount');
    doCount++;
  } while (doCount > 5);

  doCount = 0;
  while (doCount > 5) {
    print('While count is $doCount');
    doCount++;
  }

  // Коллекции List - список
  // упорядоченная коллекция элементов, доступ по индексу, может содержать дубликаты, изменяемый размер

  List<String> fruits = ['Apple', 'Pear', 'Orange'];
  print('My favorite fruits are ${fruits[0]} and ${fruits[2]}');
  print(fruits);
  fruits[1] = 'Kiwi';
  print(fruits);
  fruits.add('Grapes');
  print(fruits);
  fruits.insert(1, 'Mango');
  print(fruits);
  // print(fruits[10]);
  fruits.removeAt(2);
  print(fruits);
  fruits.insert(1, 'Grapes');
  print(fruits);
  fruits.remove('Grapes');
  print(fruits);
  print(fruits.length);
  fruits.clear();
 
  // Коллекции Map - словарь
  // неупорядоченная коллекция пар ключ-значение, ключи уникальны
  Map<String, int> ages = {'Alice': 30, 'Bob': 25, 'Charlie': 22};
  print('Bob is ${ages['Bob']} years old'); 
  ages['Charlie'] = 23;
  print(ages);
  ages['David'] = 35; 
  print(ages);
  print(ages['Jane']);
  ages.remove('Alice');
  print(ages);
  print('Total people: ${ages.length}'); // Количество пар в словаре
  print('Keys: ${ages.keys}'); // Получение всех ключей
  print('Values: ${ages.values}'); // Получение всех значений

  // Итерация по парам ключ-значение
  ages.forEach((name, age) {
    print('$name is $age years old.');
  });

  // Коллекции Set - множество
  // неупорядоченная коллекция уникальных элементов
  Set<String> colors = {'red', 'blue', 'green'};
  print(colors);
  colors.add('yellow');
  print(colors);
  colors.add('red');
  print(colors);
  colors.remove('green');
  print(colors);

  for (String c in colors) {
    print('Color: $c');
  }

  List<int> numbers = [33, -11, 5, -54, 99];
  for (int number in numbers) {
    if (number < 0) {
      break; // экстренно прерывает работу цикла
    }
    print('Number = $number');
  }
  print('------------------');
  for (int number in numbers) {
    if (number < 0) {
      continue; // прерывает работу текущего круга
    }
    print('Number = $number');
  }

  while (true) {
    print('Enter a number or "q" to exit: ');
    String value = stdin.readLineSync()!;
    if (value == 'q') {
      break;
    }
    print('Entered number x 5 = ${5 * int.parse(value)}');
  }

  List<String> robots = [];
  for (int i = 1; i <= 2000; i++) {
    if (i.toString().length == 1) {
      robots.add('Robot_00$i');
    } else if (i.toString().length == 2) {
      robots.add('Robot_0$i');
    } else {
      robots.add('Robot_$i');
    }
  }
  print(robots);
  print('End of program');
} 
