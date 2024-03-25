import 'package:mystery_dinning_adventure/domain/entities/location.dart';

class LocationModel extends LocationEntity {
  const LocationModel({
    required super.id,
    required super.latitude,
    required super.longitude,
    required super.description,
    required super.isCurrent,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json['id'] as String,
        latitude: json['latitude'] as double,
        longitude: json['longitude'] as double,
        description: json['description'] as String,
        isCurrent: json['isCurrent'] == 1,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'latitude': latitude,
        'longitude': longitude,
        'description': description,
        'isCurrent': isCurrent ? 1 : 0,
      };

  String toQuery() {
    return '''
      INSERT INTO Locations (id, latitude, longitude, description, isCurrent)
      VALUES (?, ?, ?, ?, ?)
    ''';
  }

  List<dynamic> get toQueryArguments => [
        id,
        latitude,
        longitude,
        description,
        isCurrent,
      ];

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
