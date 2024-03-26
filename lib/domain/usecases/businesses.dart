import 'package:injectable/injectable.dart';
import 'package:mystery_dinning_adventure/core/__network_export.dart';
import 'package:mystery_dinning_adventure/core/params/business.dart';
import 'package:mystery_dinning_adventure/core/usecase/usecase.dart';
import 'package:mystery_dinning_adventure/domain/repositories/repo.dart';

@lazySingleton
class GetBusinessesUsecase extends UseCase<AppState, BusinessParam> {
  GetBusinessesUsecase({
    required this.repo,
  });

  final MyRepo repo;

  @override
  Future<AppState> call({required BusinessParam params}) async {
    String query = '';

    query += '&latitude=40.7128&longitude=74.0060';
    // todo: used selected location from map
    // query += '&latitude=${params.latitude}&longitude=${params.longitude}';

    if (params.categories != null || params.categories!.isNotEmpty) {
      for (var c in params.categories!) {
        query += '&categories=$c';
      }
    }

    // if (params.radius != null) {
    //   query += '&radius=${(params.radius! * 1000).toInt()}';
    // }

    // if (params.priceInteger != null || params.priceInteger!.isNotEmpty) {
    //   for (var i in params.priceInteger!) {
    //     query += '&price=$i';
    //   }
    // }

    // if (params.attributes != null || params.attributes!.isNotEmpty) {
    //   for (var a in params.attributes!) {
    //     query += '&attributes=$a';
    //   }
    // }
    
    if (params.date != null) {
      if (params.person != null && params.person! > 0) {
        query += '&reservation_covers=${params.person}';
      }

      query +=
          '&reservation_date=${params.date!.year}-${params.date!.month}-${params.date!.day}';
    }

    return await repo.getBusiness(query);
  }
}
