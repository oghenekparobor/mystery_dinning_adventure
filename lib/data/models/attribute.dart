import 'package:mystery_dinning_adventure/domain/entities/attribute.dart';

class AttributeModel extends Attributes {
  const AttributeModel({
    super.businessTempClosed,
    super.menuUrl,
    super.open24Hours,
    super.waitlistReservation,
  });

  factory AttributeModel.fromJson(Map<String, dynamic> json) {
    return AttributeModel(
      businessTempClosed: json['business_temp_closed'],
      menuUrl: json['menu_url'],
      open24Hours: json['open24_hours'],
      waitlistReservation: json['waitlist_reservation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'business_temp_closed': businessTempClosed,
      'menu_url': menuUrl,
      'open24_hours': open24Hours,
      'waitlist_reservation': waitlistReservation,
    };
  }
}
