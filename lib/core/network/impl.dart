import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mystery_dinning_adventure/core/__network_export.dart';
import 'package:mystery_dinning_adventure/core/logger/app_logger.dart';

@lazySingleton
class ImplFormatter {
  ImplFormatter({
    required this.networkInfo,
  });

  final NetworkInfo networkInfo;

  Future<AppState> format(Function function) async {
    // this class checks and handles any exception that might occur 
    // interacting with any endpoint
    if (await networkInfo.isConnected()) {
      try {
        return LoadedState(await function.call());
      } on DioException catch (e, s) {
        AppLogger.log(e.response?.data);
        AppLogger.log(e.requestOptions.headers);
        AppLogger.log(e.message);

        AppLogger.log(s);

        if (e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.connectionTimeout) {
          return ErrorState('Connection timed out');
        }

        if (e.response == null || e.response!.data == null) {
          return ErrorState(e.response?.data['message'] ?? e.message);
        }

        if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
          return ErrorState(e.response?.data['message']);
        }

        return ErrorState(e.message ?? '');
      } catch (e, s) {
        AppLogger.log(s);

        return ErrorState(e.toString());
      }
    } else {
      return ErrorState('Please check your internet');
    }
  }
}
