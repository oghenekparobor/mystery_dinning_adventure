import 'package:equatable/equatable.dart';

class Attributes extends Equatable {
  final dynamic businessTempClosed;
  final dynamic menuUrl;
  final dynamic open24Hours;
  final dynamic waitlistReservation;

  const Attributes({
     this.businessTempClosed,
     this.menuUrl,
     this.open24Hours,
     this.waitlistReservation,
  });

  @override
  List<Object?> get props => [
        businessTempClosed,
        menuUrl,
        open24Hours,
        waitlistReservation,
      ];
}
