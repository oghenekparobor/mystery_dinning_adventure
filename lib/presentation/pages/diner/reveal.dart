import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mystery_dinning_adventure/core/app_strings.dart';
import 'package:mystery_dinning_adventure/core/extension/context.dart';

class RevealRestaurant extends StatelessWidget {
  const RevealRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LottieBuilder.asset(
            Strings.drumming,
            width: 200.w,
            height: 200.h,
            fit: BoxFit.contain,
            reverse: true,
          ),
          SizedBox(
            height: 100.h,
            child: AnimatedTextKit(
              animatedTexts: [
                for (int i = 3; i >= 1; i--) ...{
                  ScaleAnimatedText(
                    '$i',
                    textStyle: context.textTheme.displayLarge!.copyWith(
                      fontSize: 100.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                },
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 500),
              displayFullTextOnTap: true,
              onFinished: () {
                context.push(
                  Strings.dinerDeatils,
                  extra: true,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
