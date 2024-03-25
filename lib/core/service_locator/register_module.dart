// import 'package:appsflyer_sdk/appsflyer_sdk.dart';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(
          connectTimeout: const Duration(milliseconds: 15000),
          receiveTimeout: const Duration(milliseconds: 15000),
        ),
      );

  @preResolve
  Future<SharedPreferences> get preferences => SharedPreferences.getInstance();
}
