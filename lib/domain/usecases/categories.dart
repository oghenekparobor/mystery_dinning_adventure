import 'package:injectable/injectable.dart';
import 'package:mystery_dinning_adventure/core/__network_export.dart';
import 'package:mystery_dinning_adventure/core/usecase/usecase.dart';
import 'package:mystery_dinning_adventure/domain/repositories/repo.dart';

@lazySingleton
class GetCategoriesUsecase extends UseCase<AppState, NoParams> {
  GetCategoriesUsecase({
    required this.repo,
  });

  final MyRepo repo;

  @override
  Future<AppState> call({required NoParams params}) async {
    return await repo.getCategories();
  }
}
