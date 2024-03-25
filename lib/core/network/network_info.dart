import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:mystery_dinning_adventure/core/app_core.dart';
import 'package:mystery_dinning_adventure/core/extension/context.dart';
import 'package:mystery_dinning_adventure/core/resources/notification.dart';
import 'package:mystery_dinning_adventure/core/routes/route.dart';
import 'package:mystery_dinning_adventure/core/storage/storage.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
  void getConnectivity();
  void cancelInternetChecker();
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl({
    required this.storage,
  });

  final Storage storage;

  @override
  Future<bool> isConnected() async {
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  late StreamSubscription<List<ConnectivityResult>> internetCheckerSubscription;
  bool isDeviceConnected = false;

  @override
  void getConnectivity() {
    internetCheckerSubscription =
        Connectivity().onConnectivityChanged.listen((event) async {
      isDeviceConnected = await isConnected();
      final String netStat = storage.getFrom(Strings.networkStatusKey);

      if (!isDeviceConnected) {
        if (netStat != 'NO_NETWORK') {
          storage.setTo(Strings.networkStatusKey, 'NO_NETWORK');

          navkey.currentContext!.notify.addNotification(
            const NotificationTile(
              message: 'Oops! It looks like you\'ve lost your connection',
              type: NotificationType.error,
            ),
          );
        }
      } else {
        if (netStat == 'NO_NETWORK') {
          storage.setTo(Strings.networkStatusKey, 'NETWORK_AVAILABLE');
          navkey.currentContext!.notify.removeNotification();

          navkey.currentContext!.notify.addNotification(
            const NotificationTile(
              message: 'Great news! Your connection is back',
            ),
          );
        }
      }
    });
  }

  @override
  void cancelInternetChecker() {
    internetCheckerSubscription.cancel();
  }
}
