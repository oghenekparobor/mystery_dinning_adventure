import 'package:mystery_dinning_adventure/domain/entities/business.dart';

import 'attribute.dart';
import 'category.dart';
import 'coordinate.dart';
import 'location.dart';

class RestaurantModel extends Restaurant {
  const RestaurantModel({
    required super.id,
    required super.alias,
    required super.name,
    required super.imageUrl,
    required super.isClosed,
    required super.url,
    required super.reviewCount,
    required super.categories,
    required super.rating,
    required super.coordinates,
    required super.transactions,
    required super.location,
    required super.phone,
    required super.displayPhone,
    required super.distance,
    required super.attributes,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'] ?? '',
      alias: json['alias'] ?? '',
      name: json['name'] ?? '',
      imageUrl: (json['image_url'] == null || json['image_url'].isEmpty)
          ? 'https://cdn.vox-cdn.com/thumbor/TnQsfRLuAXU14TbXIjDLugrS8_0=/0x0:1000x640/1400x1400/filters:focal(500x320:501x321)/cdn0.vox-cdn.com/uploads/chorus_asset/file/8988591/Yelp_trademark_RGB_outline.jpg'
          : json['image_url'],
      isClosed: json['is_closed'] ?? false,
      url: json['url'] ?? '',
      reviewCount: json['review_count'] ?? 0,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => CategoryModel.fromJson(e))
              .toList() ??
          [],
      rating: num.parse('${json['rating'] ?? 0.0}'),
      coordinates: CoordinateModel.fromJson(json['coordinates'] ?? {}),
      transactions: (json['transactions'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      location: LocationModel.fromJson(json['location'] ?? {}),
      phone: json['phone'] ?? '',
      displayPhone: json['display_phone'] ?? '',
      distance: num.parse('${json['distance']?.toDouble() ?? 0.0}'),
      attributes: AttributeModel.fromJson(json['attributes'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'alias': alias,
      'name': name,
      'image_url': imageUrl,
      'is_closed': isClosed,
      'url': url,
      'review_count': reviewCount,
      'categories': categories.map((e) => e.toJson()).toList(),
      'rating': rating,
      'coordinates': coordinates.toJson(),
      'transactions': transactions,
      'location': location.toJson(),
      'phone': phone,
      'display_phone': displayPhone,
      'distance': distance,
      'attributes': attributes.toJson(),
    };
  }

  Restaurant copyWith({
    String? id,
    String? alias,
    String? name,
    String? imageUrl,
    bool? isClosed,
    String? url,
    int? reviewCount,
    List<CategoryModel>? categories,
    double? rating,
    CoordinateModel? coordinates,
    List<String>? transactions,
    LocationModel? location,
    String? phone,
    String? displayPhone,
    double? distance,
    AttributeModel? attributes,
  }) {
    return Restaurant(
      id: id ?? this.id,
      alias: alias ?? this.alias,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      isClosed: isClosed ?? this.isClosed,
      url: url ?? this.url,
      reviewCount: reviewCount ?? this.reviewCount,
      categories: categories ?? this.categories,
      rating: rating ?? this.rating,
      coordinates: coordinates ?? this.coordinates,
      transactions: transactions ?? this.transactions,
      location: location ?? this.location,
      phone: phone ?? this.phone,
      displayPhone: displayPhone ?? this.displayPhone,
      distance: distance ?? this.distance,
      attributes: attributes ?? this.attributes,
    );
  }

  static String get createTableQuery => '''
  CREATE TABLE IF NOT EXISTS Restaurant (
    id TEXT PRIMARY KEY,
    business_id TEXT NOT NULL,
    business_details TEXT NOT NULL
  )
''';

  static String get createTable2Query => '''
  CREATE TABLE IF NOT EXISTS Review (
    id TEXT PRIMARY KEY,
    business_id TEXT NOT NULL,
    review TEXT,
    rating REAL,
    review_date TEXT NOT NULL
  )
''';
}
