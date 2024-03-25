import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:mystery_dinning_adventure/core/database/database.dart';

abstract class LocalDS {
  Future<LocationData> getLocation();
  Future<PermissionStatus> initLocation();
  Future<bool> hasLocationPermission();
  Future<void> startDB();
}

@LazySingleton(as: LocalDS)
class LocalDSImpl extends LocalDS {
  LocalDSImpl({
    required this.location,
    required this.database,
  });

  final Location location;
  final DatabaseWrapper database;

  @override
  Future<LocationData> getLocation() async {
    return await location.getLocation();
  }

  @override
  Future<bool> hasLocationPermission() async {
    var locationStatus = await location.hasPermission();

    return (locationStatus == PermissionStatus.granted ||
        locationStatus == PermissionStatus.grantedLimited);
  }

  @override
  Future<PermissionStatus> initLocation() async {
    return await location.requestPermission();
  }

  @override
  Future<void> startDB() async {
    // todo: Add the List of create table queries
    await database.initializeDatabase('mystery_dinning_adventures', []);
  }
}
