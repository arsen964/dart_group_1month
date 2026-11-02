import 'Device.dart';

class SmartThermostat extends Device {
  double temperature = 22.0;

  SmartThermostat(super.name);

  @override
  void turnOn() {
    print('Thermostat $name is on');
  }

  @override
  void turnOff() {
    print('Thermostat $name is off');
  }

  @override
  void showInfo() {
    super.showInfo();
    print('$name Temperature: $temperature°C');
  }
}
