import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:mystery_dinning_adventure/core/database/database.dart';
import 'package:mystery_dinning_adventure/data/models/restaurant.dart';

abstract class LocalDS {
  Future<LocationData> getLocation();
  Future<PermissionStatus> initLocation();
  Future<bool> hasLocationPermission();
  Future<void> startDB();
  Future<void> saveToDB({
    required String table,
    required Map<String, dynamic> data,
  });
  Future<List<Map<String, dynamic>>> readDB(
    String table, [
    String whereClause,
    List? whereArgs,
  ]);
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
    await database.initializeDatabase('mystery_dinning_adventures', [
      RestaurantModel.createTableQuery,
      RestaurantModel.createTable2Query,
    ]);
  }

  @override
  Future<void> saveToDB({
    required String table,
    required Map<String, dynamic> data,
  }) async {
    return await database.save(table: table, data: data);
  }

  @override
  Future<List<Map<String, dynamic>>> readDB(
    String table, [
    String? whereClause,
    List? whereArgs,
  ]) async {
    return await database.read(table, whereClause, whereArgs);
  }
}
