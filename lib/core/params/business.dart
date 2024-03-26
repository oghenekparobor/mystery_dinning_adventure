class BusinessParam {
  BusinessParam({
    required this.attributes,
    required this.categories,
    required this.date,
    required this.latitude,
    required this.longitude,
    required this.person,
    required this.priceInteger,
    required this.radius,
  });

  final double latitude;
  final double longitude;
  final Set<String>? categories;
  final double? radius;
  final List<int>? priceInteger;
  final Set<String>? attributes;
  final int? person;
  final DateTime? date;
}