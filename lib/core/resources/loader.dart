import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mystery_dinning_adventure/core/app_strings.dart';
import 'package:mystery_dinning_adventure/core/routes/route.dart';

class AppLoader {
  static void show() {
    showDialog(
      context: navkey.currentContext!,
      builder: (_) {
        return Center(
          child: LottieBuilder.asset(Strings.searching),
        );
      },
    );
  }
}
