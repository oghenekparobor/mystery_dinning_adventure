import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mystery_dinning_adventure/core/__extension_export.dart';
import 'package:mystery_dinning_adventure/core/app_strings.dart';
import 'package:mystery_dinning_adventure/presentation/notifier/notifier.dart';
import 'package:mystery_dinning_adventure/presentation/widgets/diner_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Pulse(
        child: FloatingActionButton(
          key: const ValueKey('floating_action_button'),
          onPressed: () {
            context.push(Strings.dinningPreference);
          },
          backgroundColor: Colors.amber,
          isExtended: true,
          child: Image.asset(
            Strings.findRestaurant,
            width: 30.w,
            height: 30.h,
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          key: const ValueKey('app_bar_widget'),
          'Mystery Dinning',
          style: context.textTheme.bodyMedium,
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          16.verticalSpace,
          Expanded(
            child: FutureBuilder(
              future: context.watch<MyNotifier>().fetchRestaurants(),
              builder: (context, snapshot) {
                return Consumer<MyNotifier>(
                  builder: (_, value, child) {
                    if (value.restaurants.isEmpty) {
                      return child!;
                    } else {
                      var logs = value.restaurants;

                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            for (var log in logs) ...{
                              DinerTile(model: log),
                            },
                          ],
                        ),
                      );
                    }
                  },
                  child: Center(
                    child: LottieBuilder.asset(
                      Strings.empty,
                      width: 250.w,
                      height: 250.h,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
