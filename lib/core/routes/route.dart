import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mystery_dinning_adventure/core/app_core.dart';
import 'package:mystery_dinning_adventure/data/models/restaurant.dart';
import 'package:mystery_dinning_adventure/presentation/notifier/notifier.dart';
import 'package:mystery_dinning_adventure/presentation/pages/diner/see_restaurant.dart';
import 'package:mystery_dinning_adventure/presentation/pages/home/home.dart';
import 'package:mystery_dinning_adventure/presentation/pages/location/location.dart';
import 'package:mystery_dinning_adventure/presentation/pages/diner/dinning_preference.dart';
import 'package:mystery_dinning_adventure/presentation/pages/diner/reveal.dart';
import 'package:mystery_dinning_adventure/presentation/pages/diner/roullete.dart';
import 'package:mystery_dinning_adventure/presentation/pages/diner/select_reveal.dart';
import 'package:mystery_dinning_adventure/presentation/pages/splash.dart';

GlobalKey<NavigatorState> navkey = GlobalKey();

final routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Strings.homePage,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: Strings.locationPage,
      builder: (context, state) => const MyLocationPage(),
    ),
    GoRoute(
      path: Strings.dinningPreference,
      builder: (context, state) => const SetDinningPreference(),
    ),
    GoRoute(
      path: Strings.selectReveal,
      builder: (context, state) => const SelectDiningReveal(),
    ),
    GoRoute(
      path: Strings.spinAWheel,
      builder: (context, state) => SpinAWheel(
        businesses: (state.extra as List),
      ),
    ),
    GoRoute(
      path: Strings.revealRestaurant,
      builder: (context, state) => const RevealRestaurant(),
    ),
    GoRoute(
      path: Strings.dinerDeatils,
      builder: (context, state) {
        var extra = state.extra as Map<String, dynamic>;

        return DinerDetails(
          fromResult: extra['fromResult'] ?? false,
          restaurant: extra['restaurant'] != null
              ? RestaurantModel.fromJson(extra['restaurant'])
              : null,
        );
      },
    ),
  ],
  navigatorKey: navkey,
);
