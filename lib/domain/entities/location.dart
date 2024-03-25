import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final String id;
  final double latitude;
  final double longitude;
  final String description;
  final bool isCurrent;

  const LocationEntity({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.isCurrent,
  });

  @override
  List<Object?> get props => [
        id,
        latitude,
        longitude,
        description,
        isCurrent,
      ];
}
