import 'interfaces.dart';
import 'mixins.dart';

abstract class Device implements Switchable {
  final String name;
  Device(this.name);
  void showInfo() {
    print('Device: $name');
  }
}
