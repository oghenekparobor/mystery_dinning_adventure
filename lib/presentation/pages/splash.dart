import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mystery_dinning_adventure/core/__extension_export.dart';
import 'package:mystery_dinning_adventure/core/__resources_export.dart';
import 'package:mystery_dinning_adventure/core/app_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), _init);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        key: const ValueKey('splash_icon'),
        child: LottieBuilder.asset(
          Strings.splash,
        ),
      ),
    );
  }

  FutureOr _init() async {
    if (await context.myn.hasPermission()) {
      if (mounted) {
        context.go(Strings.homePage);
      }
    } else {
      if (mounted) {
        context.notify.addNotification(
          const NotificationTile(
            message: 'Location Permission needed',
            type: NotificationType.warning,
          ),
        );

        context.myn.getPermission().then((value) {
          if (value) {
            context.notify.addNotification(
              NotificationTile(
                message: 'Permission denied',
                type: NotificationType.error,
                action: 'Open settings',
                onTap: () {},
              ),
            );
          } else {
            _init();
          }

          context.go(Strings.homePage);
        });
      }
    }
  }
}
