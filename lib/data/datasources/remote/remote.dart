import 'package:injectable/injectable.dart';
import 'package:mystery_dinning_adventure/core/__network_export.dart';

abstract class RemoteDS {
  Future<dynamic> getCategories();
  Future<dynamic> getBusinesses(String query);
}

@LazySingleton(as: RemoteDS)
class RemoteDSImpl extends RemoteDS {
  RemoteDSImpl({
    required this.wrapper,
  });

  final DioWrapper wrapper;

  @override
  Future getCategories() async {
    return await wrapper.get(
      '/v3/categories',
      isProtected: true,
    );
  }

  @override
  Future getBusinesses(String query) async {
    return await wrapper.get(
      '/v3/businesses/search?term=restaurants&sort_by=best_match$query&limit=50',
    );
  }
}
