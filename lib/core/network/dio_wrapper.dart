import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mystery_dinning_adventure/core/env/env.dart';
import 'package:mystery_dinning_adventure/core/logger/app_logger.dart';

@lazySingleton
class DioWrapper {
  DioWrapper({
    required this.dio,
  });

  final Dio dio;

  Future<dynamic> get(
    String endpoint, {
    bool isProtected = true,
    bool isFormData = false,
  }) async {
    Response response = await dio.get(
      '${Env.baseUrl}$endpoint',
      options: Options(headers: {
        if (isProtected) 'Authorization': 'Bearer ${Env.apiKey}',
        'Content-Type': isFormData ? 'multipart/form-data' : 'application/json',
      }),
    );

    return response.data;
  }

  Future<dynamic> post(
    String endpoint, {
    required Map<String, dynamic> data,
    bool isProtected = true,
    bool isFormData = false,
  }) async {
    AppLogger.log(data);

    Response response = await dio.post(
      '${Env.baseUrl}$endpoint',
      data: isFormData ? FormData.fromMap(data) : data,
      options: Options(headers: {
        if (isProtected) 'Authorization': 'Bearer ${Env.apiKey}',
        'Content-Type': isFormData ? 'multipart/form-data' : 'application/json',
      }),
    );

    return response.data;
  }
}
