import 'package:location/location.dart';
import 'package:mystery_dinning_adventure/data/models/restaurant.dart';

import '../../core/network/state.dart';

abstract class MyRepo {
  Future<bool> hasLocationPermission();
  Future<bool> initLocation();
  Future<LocationData> getLocation();
  Future<void> init();
  Future<AppState> getCategories();
  Future<AppState> getBusiness(String query);
  Future<void> addToAdventureLog(Map<String, dynamic> data);
  Future<void> addReview(Map<String, dynamic> data);
  Future<List<RestaurantModel>> readAdventureLog();
  Future<List> readReview(String id);
}
