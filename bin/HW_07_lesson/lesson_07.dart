import 'SmartLamp.dart';
import 'SmartSpeaker.dart';
import 'SmartThermostat.dart';
import 'Device.dart';
import 'interfaces.dart';
import 'mixins.dart';

void main() {
  List<Device> devices = [
    SmartThermostat('Hallway Thermostat'),
    SmartLamp('Living Room Lamp'),
    SmartSpeaker('Kitchen Speaker'),
  ];

  for (Device d in devices) {
    d.showInfo();
    d.turnOn();
    if (d is Adjustable) {
      (d as Adjustable).increase();
    }
    if (d is BatteryPowered) {
      (d as BatteryPowered).showBattery();
    }
  }
  print('All devices processed.');
}
