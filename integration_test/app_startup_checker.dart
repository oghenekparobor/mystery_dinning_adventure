import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mystery_dinning_adventure/core/service_locator/injection_container.dart';
import 'package:mystery_dinning_adventure/domain/repositories/repo.dart';
import 'package:mystery_dinning_adventure/main.dart' as mystery;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await configureDependencies();

    // Initialize the database at app start up
    await sl<MyRepo>().init();
  });

  testWidgets('Check to see if app starts and splash icon is found',
      (tester) async {
    // await Adb.shell (
    //     'pm grant <your_package_name> android.permission.ACCESS_FINE_LOCATION');

    // start up the mystery dinning app
    await tester.pumpWidget(const mystery.MyApp());

    // accept location permission
    // final result = await Process.run(
    //   'adb',
    //   [
    //     'pm grant com.example.mystery_dinning_adventure android.permission.FOREGROUND_SERVICE'
    //   ],
    //   runInShell: true,
    // );

    // if (result.exitCode != 0) {
    //   throw Exception('Failed to grant location permission');
    // }

    await tester.pumpAndSettle();

    final splashKey = find.byKey(const ValueKey('splash_icon'));
    expect(splashKey, findsOneWidget);

    await Future.delayed(const Duration(seconds: 20));

    // check that splash is no longer showing
    expect(splashKey, findsNothing);

    // confirm home screen is opened
    // final floatingButton = find.byKey(const ValueKey('floating_action_button'));
    // expect(floatingButton, findsOneWidget);

    // await tester.tap(floatingButton);

    // final scaffold =
    //     find.byKey(const ValueKey('set_dinning_preference_scaffold'));
    // expect(scaffold, findsOneWidget);

    // await tester.pump();

    // final changeLocation = find.byKey(const ValueKey('change_location_tap'));
    // expect(changeLocation, findsOneWidget);

    // await tester.tap(changeLocation);
    // await tester.pump();
  });
}
