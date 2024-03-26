import 'package:equatable/equatable.dart';
import 'package:mystery_dinning_adventure/data/models/attribute.dart';
import 'package:mystery_dinning_adventure/data/models/category.dart';
import 'package:mystery_dinning_adventure/data/models/coordinate.dart';
import 'package:mystery_dinning_adventure/data/models/location.dart';

class Restaurant extends Equatable {
  final String id;
  final String alias;
  final String name;
  final String imageUrl;
  final bool isClosed;
  final String url;
  final int reviewCount;
  final List<CategoryModel> categories;
  final double rating;
  final CoordinateModel coordinates;
  final List<String> transactions;
  final LocationModel location;
  final String phone;
  final String displayPhone;
  final double distance;
  final AttributeModel attributes;

  const Restaurant({
    required this.id,
    required this.alias,
    required this.name,
    required this.imageUrl,
    required this.isClosed,
    required this.url,
    required this.reviewCount,
    required this.categories,
    required this.rating,
    required this.coordinates,
    required this.transactions,
    required this.location,
    required this.phone,
    required this.displayPhone,
    required this.distance,
    required this.attributes,
  });

  @override
  List<Object?> get props => [
        id,
        alias,
        name,
        imageUrl,
        isClosed,
        url,
        reviewCount,
        categories,
        rating,
        coordinates,
        transactions,
        location,
        phone,
        displayPhone,
        distance,
        attributes,
      ];
}
