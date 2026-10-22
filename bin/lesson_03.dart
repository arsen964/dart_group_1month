void main() {
  print('Start of program');
  for (int i = 1; i <= 30; i = i + 1) {
    if (i % 3 == 0 && i % 5 == 0) {
      print('FizzBuzz');
    } else if (i % 3 == 0) {
      print('Fizz');
    } else if (i % 5 == 0) {
      print('Buzz');
    } else {
      print(i);
    }
  }

  print('--------------------');
  List<int> numbers = [3, -2, 0, 7, -5, 10, 1];
  int count = 0;
  int sum = 0;
  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] > 0) {
      count++;
      sum += numbers[i];
    }
  }
  if (count > 0) {
    double average = sum / count;
    print('Positive numbers count: $count');
    print('Average of positive numbers: $average');
  } else {
    print('No positive numbers');
  }

  print('--------------------');
  Map<String, int> fruits = {'Apple': 5, 'Banana': 2, 'Mango': 7, 'Orange': 0};
  fruits.forEach((key, value) {
    if (value > 0) {
      print('$key: $value pcs');
    }
  });
}
