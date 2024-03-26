// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../data/datasources/local/local.dart' as _i11;
import '../../data/datasources/remote/remote.dart' as _i7;
import '../../data/repositories/repo_impl.dart' as _i15;
import '../../domain/repositories/repo.dart' as _i14;
import '../../domain/usecases/businesses.dart' as _i17;
import '../../domain/usecases/categories.dart' as _i18;
import '../../domain/usecases/location.dart' as _i19;
import '../../domain/usecases/log.dart' as _i16;
import '../../presentation/notifier/notifier.dart' as _i20;
import '../__network_export.dart' as _i8;
import '../database/database.dart' as _i3;
import '../network/dio_wrapper.dart' as _i5;
import '../network/impl.dart' as _i13;
import '../network/network_info.dart' as _i12;
import '../storage/storage.dart' as _i10;
import 'register_module.dart' as _i21;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.DatabaseWrapper>(() => _i3.DatabaseWrapper());
  gh.lazySingleton<_i4.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i5.DioWrapper>(() => _i5.DioWrapper(dio: gh<_i4.Dio>()));
  gh.lazySingleton<_i6.Location>(() => registerModule.location);
  gh.lazySingleton<_i7.RemoteDS>(
      () => _i7.RemoteDSImpl(wrapper: gh<_i8.DioWrapper>()));
  await gh.factoryAsync<_i9.SharedPreferences>(
    () => registerModule.preferences,
    preResolve: true,
  );
  gh.lazySingleton<_i10.Storage>(
      () => _i10.StorageImpl(preferences: gh<_i9.SharedPreferences>()));
  gh.lazySingleton<_i11.LocalDS>(() => _i11.LocalDSImpl(
        location: gh<_i6.Location>(),
        database: gh<_i3.DatabaseWrapper>(),
      ));
  gh.lazySingleton<_i12.NetworkInfo>(
      () => _i12.NetworkInfoImpl(storage: gh<_i10.Storage>()));
  gh.lazySingleton<_i13.ImplFormatter>(
      () => _i13.ImplFormatter(networkInfo: gh<_i8.NetworkInfo>()));
  gh.lazySingleton<_i14.MyRepo>(() => _i15.MyRepoImpl(
        localDS: gh<_i11.LocalDS>(),
        remoteDS: gh<_i7.RemoteDS>(),
        fmt: gh<_i8.ImplFormatter>(),
      ));
  gh.lazySingleton<_i16.AdventureLogUsecase>(
      () => _i16.AdventureLogUsecaseImpl(repo: gh<_i14.MyRepo>()));
  gh.lazySingleton<_i17.GetBusinessesUsecase>(
      () => _i17.GetBusinessesUsecase(repo: gh<_i14.MyRepo>()));
  gh.lazySingleton<_i18.GetCategoriesUsecase>(
      () => _i18.GetCategoriesUsecase(repo: gh<_i14.MyRepo>()));
  gh.lazySingleton<_i19.LocationUsecase>(
      () => _i19.LocationUsecaseImpl(repo: gh<_i14.MyRepo>()));
  gh.lazySingleton<_i20.MyNotifier>(() => _i20.MyNotifier(
        locationUsecase: gh<_i19.LocationUsecase>(),
        categoriesUsecase: gh<_i18.GetCategoriesUsecase>(),
        getBusinessesUsecase: gh<_i17.GetBusinessesUsecase>(),
        adventureLogUsecase: gh<_i16.AdventureLogUsecase>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i21.RegisterModule {}
