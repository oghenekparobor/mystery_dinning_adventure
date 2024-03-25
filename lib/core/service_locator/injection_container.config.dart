// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i9;
import 'package:sqflite/sqflite.dart' as _i4;

import '../../data/datasources/local/local.dart' as _i7;
import '../__network_export.dart' as _i13;
import '../database/database.dart' as _i3;
import '../network/dio_wrapper.dart' as _i6;
import '../network/impl.dart' as _i12;
import '../network/network_info.dart' as _i11;
import '../storage/storage.dart' as _i10;
import 'register_module.dart' as _i14;

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
  gh.lazySingleton<_i3.DatabaseWrapper>(
      () => _i3.DatabaseWrapper(database: gh<_i4.Database>()));
  gh.lazySingleton<_i5.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i6.DioWrapper>(() => _i6.DioWrapper(dio: gh<_i5.Dio>()));
  gh.lazySingleton<_i7.LocalDS>(() => _i7.LocalDSImpl(
        location: gh<_i8.Location>(),
        database: gh<_i3.DatabaseWrapper>(),
      ));
  await gh.factoryAsync<_i9.SharedPreferences>(
    () => registerModule.preferences,
    preResolve: true,
  );
  gh.lazySingleton<_i10.Storage>(
      () => _i10.StorageImpl(preferences: gh<_i9.SharedPreferences>()));
  gh.lazySingleton<_i11.NetworkInfo>(
      () => _i11.NetworkInfoImpl(storage: gh<_i10.Storage>()));
  gh.lazySingleton<_i12.ImplFormatter>(
      () => _i12.ImplFormatter(networkInfo: gh<_i13.NetworkInfo>()));
  return getIt;
}

class _$RegisterModule extends _i14.RegisterModule {}
