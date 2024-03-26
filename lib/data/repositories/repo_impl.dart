import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:mystery_dinning_adventure/core/__network_export.dart';
import 'package:mystery_dinning_adventure/core/extension/state.dart';
import 'package:mystery_dinning_adventure/core/logger/app_logger.dart';
import 'package:mystery_dinning_adventure/data/datasources/local/local.dart';
import 'package:mystery_dinning_adventure/data/datasources/remote/remote.dart';
import 'package:mystery_dinning_adventure/data/models/restaurant.dart';
import 'package:mystery_dinning_adventure/domain/repositories/repo.dart';

@LazySingleton(as: MyRepo)
class MyRepoImpl implements MyRepo {
  MyRepoImpl({
    required this.localDS,
    required this.remoteDS,
    required this.fmt,
  });

  final RemoteDS remoteDS;
  final LocalDS localDS;
  final ImplFormatter fmt;

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

  @override
  Future<AppState> getCategories() async {
    var res = await fmt.format(() async {
      return await remoteDS.getCategories();
    });

    if (res.isError) {
      return res;
    } else {
      var data = (res as LoadedState).data['categories'] as List;

      // retain only categories with parent alias as [restaurants]
      data.retainWhere(
        (e) => (e['parent_aliases'] as List).contains('restaurants'),
      );

      // extract the alias from the list of category model
      List aliasList = data.map((category) => category['alias']).toList();

      // todo: reduces the size

      return LoadedState(aliasList);
    }
  }

  @override
  Future<AppState> getBusiness(String query) async {
    return await fmt.format(() async {
      return await remoteDS.getBusinesses(query);
    });
  }

  @override
  Future<void> addReview(Map<String, dynamic> data) async {
    return await localDS.saveToDB(table: 'Review', data: data);
  }

  @override
  Future<void> addToAdventureLog(Map<String, dynamic> data) async {
    return await localDS.saveToDB(table: 'Restaurant', data: data);
  }

  @override
  Future<List<RestaurantModel>> readAdventureLog() async {
    var data = await localDS.readDB('Restaurant');

    // read from the database-> decode the encoded business -> make it into a list
    return data
        .map((e) => RestaurantModel.fromJson(jsonDecode(e['business_details'])))
        .toList();
  }

  @override
  Future<List> readReview(String id) async {
    var data = await localDS.readDB('Review', 'business_id = ?', [id]);

    return data;
  }
}
