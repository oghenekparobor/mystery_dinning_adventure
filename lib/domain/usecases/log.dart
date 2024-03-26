import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:mystery_dinning_adventure/data/models/restaurant.dart';
import 'package:mystery_dinning_adventure/domain/repositories/repo.dart';

abstract class AdventureLogUsecase {
  Future<void> addRestaurantToLog(RestaurantModel restaurant);
  Future<void> addReview(Map<String, dynamic> data);
  Future<List<RestaurantModel>> fetchRestaurants();
  Future<List> fetchReview(String id);
}

@LazySingleton(as: AdventureLogUsecase)
class AdventureLogUsecaseImpl extends AdventureLogUsecase {
  AdventureLogUsecaseImpl({
    required this.repo,
  });

  final MyRepo repo;

  @override
  Future<void> addRestaurantToLog(RestaurantModel restaurant) async {
    return await repo.addToAdventureLog({
      'business_id': restaurant.id,
      'business_details': jsonEncode(restaurant.toJson()),
    });
  }

  @override
  Future<void> addReview(Map<String, dynamic> data) async {
    return await repo.addReview(data);
  }

  @override
  Future<List<RestaurantModel>> fetchRestaurants() async {
    return await repo.readAdventureLog();
  }

  @override
  Future<List> fetchReview(String id) async {
    return await repo.readReview(id);
  }
}
