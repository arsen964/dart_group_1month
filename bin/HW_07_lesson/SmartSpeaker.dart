import 'Device.dart';
import 'interfaces.dart';
import 'mixins.dart';


class SmartSpeaker extends Device with BatteryPowered implements Adjustable {
  int volume = 0;

  SmartSpeaker(super.name);

  @override
  void turnOn() {
    print('Speaker $name is on');
  }

  @override
  void turnOff() {
    print('Speaker $name is off');
  }

  @override
  void increase() {
    if (volume < 100) {
      volume += 5;
      print('$name volume increased to $volume');
    } else {
      print('$name volume is already at maximum');
    }
  }

  @override
  void decrease() {
    if (volume > 0) {
      volume -= 5;
      print('$name volume decreased to $volume');
    } else {
      print('$name volume is already at minimum');
    }
  }

  @override
  void showInfo() {
    super.showInfo();
    print('$name Volume: $volume');
  }
}
