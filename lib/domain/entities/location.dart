import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String address1;
  final String? address2;
  final String? address3;
  final String city;
  final String zipCode;
  final String country;
  final String state;
  final List<String> displayAddress;

  const Location({
    required this.address1,
     this.address2,
     this.address3,
    required this.city,
    required this.zipCode,
    required this.country,
    required this.state,
    required this.displayAddress,
  });

  @override
  List<Object?> get props => [
        address1,
        address2,
        address3,
        city,
        zipCode,
        country,
        state,
        displayAddress,
      ];
}
