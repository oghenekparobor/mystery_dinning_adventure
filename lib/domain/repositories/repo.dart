import 'package:location/location.dart';

abstract class MyRepo {
  Future<bool> hasLocationPermission();
  Future<bool> initLocation();
  Future<LocationData> getLocation();
  Future<void> init();
}
