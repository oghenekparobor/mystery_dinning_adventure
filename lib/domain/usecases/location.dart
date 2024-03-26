import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:mystery_dinning_adventure/domain/repositories/repo.dart';

abstract class LocationUsecase {
  Future<bool> hasPermission();
  Future<bool> getPermission();
  Future<LocationData> getLocation();
}

@LazySingleton(as: LocationUsecase)
class LocationUsecaseImpl extends LocationUsecase {
  LocationUsecaseImpl({
    required this.repo,
  });

  final MyRepo repo;

  @override
  Future<LocationData> getLocation() async {
    return await repo.getLocation();
  }

  @override
  Future<bool> getPermission() async {
    return await repo.initLocation();
  }

  @override
  Future<bool> hasPermission() async {
    return await repo.hasLocationPermission();
  }
}
