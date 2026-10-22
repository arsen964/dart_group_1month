import 'dart:io';

void main() {
  print('Write your age:');
  int age = int.parse(stdin.readLineSync()!); //Write your age
  print('Write tempreture:');
  int tempreture = int.parse(stdin.readLineSync()!); //Writetempreture
  if (age >= 20 && age <= 45 && tempreture >= -20 && tempreture <= 30) {
    print('You can go for a walk.');
  } else if (age < 20 && tempreture >= 0 && tempreture <= 28) {
    print('You can go for a walk.');
  } else if (age > 45 && tempreture >= -10 && tempreture <= 25) {
    print('You can go for a walk.');
  } else {
    print('Stay at home.');
  }

  print('Write a day of the week:');
  String day = stdin.readLineSync()!.toLowerCase();
  switch (day) {
    case 'monday':
      print("It's the satrt of the week.");
      break;

    case 'tuesday':
    case 'wednesday':
    case 'thursday':
      print('Keep going, almost weekend!');
      break;

    case 'friday':
      print('Weekend is coming!');
      break;
    case 'saturday':
    case 'sunday':
      print('Enjoy your weekend!');
      break;

    default:
      print('Invalid day');
  }

  print('Enter your password:');
  String password = stdin.readLineSync()!;

  if (password.isEmpty) {
    print('Password cannot be empty.');
  } else {
    if (password.length < 6) {
      print('Password is too short.');
    } else {
      if (password == 'dart123') {
        print('Access granted.');
      } else {
        print('Wrong password.');
      }
    }
  }
}
 