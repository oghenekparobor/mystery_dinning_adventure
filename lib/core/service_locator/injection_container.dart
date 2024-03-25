import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mystery_dinning_adventure/core/service_locator/injection_container.config.dart';

GetIt sl = GetIt.instance;

@InjectableInit(
  asExtension: false,
  preferRelativeImports: true,
)
Future<void> configureDependencies() async => init(sl);
