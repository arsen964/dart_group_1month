import 'dart:io';

void main() {
  int warm = 0; // t > 20
  int cool = 0; // 10 <= t <= 20
  int cold = 0; // t < 10

  for (int i = 1; i <= 7; i++) {
    print('Enter temperature for the day $i:');
    int temperature = int.parse(stdin.readLineSync()!);
    if (temperature > 20) {
      print('It is warm today!');
      warm++;
    } else if (temperature >= 10 && temperature <= 20) {
      print('It is cool today!');
      cool++;
    } else {
      print('It is cold today!');
      cold++;
    }
    print('Warm days: $warm');
    print('Cool days: $cool');
    print('Cold days: $cold');
    print('Weekly temperature analysis completed.');
  }
}
