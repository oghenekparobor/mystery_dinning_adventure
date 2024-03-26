import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:mystery_dinning_adventure/core/__extension_export.dart';
import 'package:mystery_dinning_adventure/core/__network_export.dart';
import 'package:mystery_dinning_adventure/core/__resources_export.dart';
import 'package:mystery_dinning_adventure/core/extension/state.dart';
import 'package:mystery_dinning_adventure/core/logger/app_logger.dart';
import 'package:mystery_dinning_adventure/core/params/business.dart';
import 'package:mystery_dinning_adventure/core/routes/route.dart';
import 'package:mystery_dinning_adventure/core/usecase/usecase.dart';
import 'package:mystery_dinning_adventure/data/models/restaurant.dart';
import 'package:mystery_dinning_adventure/domain/usecases/businesses.dart';
import 'package:mystery_dinning_adventure/domain/usecases/categories.dart';
import 'package:mystery_dinning_adventure/domain/usecases/location.dart';
import 'package:mystery_dinning_adventure/domain/usecases/log.dart';

@lazySingleton
class MyNotifier with ChangeNotifier {
  MyNotifier({
    required this.locationUsecase,
    required this.categoriesUsecase,
    required this.getBusinessesUsecase,
    required this.adventureLogUsecase,
  });

  final LocationUsecase locationUsecase;
  final GetCategoriesUsecase categoriesUsecase;
  final GetBusinessesUsecase getBusinessesUsecase;
  final AdventureLogUsecase adventureLogUsecase;

  Future<bool> hasPermission() async => await locationUsecase.hasPermission();

  Future<bool> getPermission() async => await locationUsecase.getPermission();

  LocationData? myLocation;

  LatLong? setCoordinates;

  void setCoordinate(LatLong latLong) {
    setCoordinates = latLong;

    notifyListeners();
  }

  Future<void> getLocation() async {
    myLocation = await locationUsecase.getLocation();

    notifyListeners();
  }

  List? categories;

  Future<void> getCategories() async {
    categories = null;

    categoriesUsecase.call(params: const NoParams()).then((value) {
      if (value.isError) {
        navkey.currentContext!.notify.addNotification(
          NotificationTile(
            message: 'Error fetching categories',
            type: NotificationType.error,
            action: 'Try Again',
            onTap: () => getCategories(),
          ),
        );
        categories = [];
      } else {
        categories = (value as LoadedState).data;
      }

      notifyListeners();
    });
  }

  Set<String> selectedCategories = <String>{};

  void addRemoveCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }

    notifyListeners();
  }

  bool isCategorySelected(String category) {
    return selectedCategories.contains(category);
  }

  List<String> attributes = [
    'hot_and_new',
    'deals',
    'gender_neutral_restrooms',
    'open_to_all',
    'wheelchair_accessible',
  ];

  Set<String> selectedAttributes = <String>{};

  void addRemoveAttribute(String value) {
    if (selectedAttributes.contains(value)) {
      selectedAttributes.remove(value);
    } else {
      selectedAttributes.add(value);
    }

    notifyListeners();
  }

  bool isAtrributeSelected(String value) {
    return selectedAttributes.contains(value);
  }

  int? numberOfPersons = 0;
  double km = 10.0;
  double? startCost = 700.0;
  double? endCost = 6000.0;
  DateTime? reservationDate;

  // get price integer for price range selected
  int categorizeAmount(double amount) {
    if (amount >= 5 && amount < 100) {
      return 1;
    } else if (amount >= 100 && amount < 1000) {
      return 2;
    } else if (amount >= 1000 && amount < 5000) {
      return 3;
    } else {
      return 4;
    }
  }

  dynamic businesses;

  Future<AppState> searchBusiness() async {
    var res = await getBusinessesUsecase.call(
      params: BusinessParam(
        attributes: selectedAttributes,
        categories: selectedCategories,
        date: reservationDate,
        latitude: setCoordinates?.latitude ?? 0.0,
        longitude: setCoordinates?.longitude ?? 0.0,
        person: numberOfPersons,
        priceInteger: [
          categorizeAmount(startCost ?? 0.0),
          categorizeAmount(endCost ?? 0.0),
        ],
        radius: km,
      ),
    );

    if (!res.isError) {
      businesses = (res as LoadedState).data;

      AppLogger.log(businesses);
    }

    return res;
  }

  List<RestaurantModel> restaurants = [];

  Future<void> fetchRestaurants() async {
    restaurants = await adventureLogUsecase.fetchRestaurants();

    notifyListeners();
  }

  Future<void> addToLog(RestaurantModel model) async {
    await adventureLogUsecase.addRestaurantToLog(model);

    await fetchRestaurants();
  }

  List? reviews;

  Future<void> fetchReviews(String id) async {
    reviews = await adventureLogUsecase.fetchReview(id);

    notifyListeners();
  }

  Future<void> leaveReview(String id, String text, double rating) async {
    await adventureLogUsecase.addReview({
      'business_id': id,
      'review': text,
      'rating': rating,
      'review_date': DateTime.now().toIso8601String(),
    });

    fetchReviews(id);
  }
}
