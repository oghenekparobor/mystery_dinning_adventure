import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:mystery_dinning_adventure/data/datasources/local/local.dart';
import 'package:mystery_dinning_adventure/data/datasources/remote/remote.dart';
import 'package:mystery_dinning_adventure/domain/repositories/repo.dart';

@LazySingleton(as: MyRepo)
class MyRepoImpl implements MyRepo {
  MyRepoImpl({
    required this.localDS,
    required this.remoteDS,
  });

  final RemoteDS remoteDS;
  final LocalDS localDS;

  @override
  Future<LocationData> getLocation() async {
    return await localDS.getLocation();
  }

  @override
  Future<bool> hasLocationPermission() async {
    return await localDS.hasLocationPermission();
  }

  @override
  Future<void> init() async {
    return await localDS.startDB();
  }

  @override
  Future<bool> initLocation() async {
    var status = await localDS.initLocation();

    // if denied show an instruction for user to take
    return (status == PermissionStatus.denied ||
        status == PermissionStatus.deniedForever);
  }
}
