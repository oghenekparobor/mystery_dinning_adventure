import 'package:mystery_dinning_adventure/domain/entities/coordinate.dart';

class CoordinateModel extends Coordinates {
  const CoordinateModel({
    required super.latitude,
    required super.longitude,
  });

  factory CoordinateModel.fromJson(Map<String, dynamic> json) {
    return CoordinateModel(
      latitude: json['latitude'] ?? 0.0,
      longitude: json['longitude'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
