import 'package:mystery_dinning_adventure/domain/entities/location.dart';

class LocationModel extends Location {
  const LocationModel({
    required super.address1,
    super.address2,
    super.address3,
    required super.city,
    required super.zipCode,
    required super.country,
    required super.state,
    required super.displayAddress,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      address1: json['address1'] ?? '',
      address2: json['address2'],
      address3: json['address3'],
      city: json['city'] ?? '',
      zipCode: json['zip_code'] ?? '',
      country: json['country'] ?? '',
      state: json['state'] ?? '',
      displayAddress: List<String>.from(json['display_address'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address1': address1,
      'address2': address2,
      'address3': address3,
      'city': city,
      'zip_code': zipCode,
      'country': country,
      'state': state,
      'display_address': displayAddress,
    };
  }

  static String get createTableQuery => '''
    CREATE TABLE IF NOT EXISTS Locations (
      id TEXT PRIMARY KEY,
      latitude REAL NOT NULL,
      longitude REAL NOT NULL,
      description TEXT,
      isCurrent INTEGER NOT NULL
    )
  ''';
}
