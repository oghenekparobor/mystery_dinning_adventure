import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mystery_dinning_adventure/main.dart';

GlobalKey<NavigatorState> navkey = GlobalKey();

final routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(title: ''),
    ),
  ],
  navigatorKey: navkey,
);
