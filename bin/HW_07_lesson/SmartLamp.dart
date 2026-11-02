import 'interfaces.dart';
import 'mixins.dart';
import 'Device.dart';

class SmartLamp extends Device
    with BatteryPowered
    implements Adjustable {
  int brightness = 0;

  SmartLamp(super.name);

  @override
  void turnOn() {
    print('Lamp $name is on');
  }

  @override
  void turnOff() {
    print('Lamp $name is off');
  }

  @override
  void increase() {
    if (brightness < 100) {
      brightness += 10;
      print('$name brightness increased to $brightness');
    } else {
      print('$name brightness is already at maximum');
    }
  }

  @override
  void decrease() {
    if (brightness > 0) {
      brightness -= 10;
      print('$name brightness decreased to $brightness');
    } else {
      print('$name brightness is already at minimum');
    }
  }

  @override
  void showInfo() {
    super.showInfo();
    print('$name Brightness: $brightness'); 
  }
}
