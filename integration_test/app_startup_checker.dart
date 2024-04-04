import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mystery_dinning_adventure/main.dart' as mystery;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('check to see the mystery app start and select category',
      (tester) async {
    // await adbShell(
    //     'pm grant <your_package_name> android.permission.ACCESS_FINE_LOCATION');

    // start up the mystery dinning app
    await mystery.main();
    await tester.pumpWidget(const mystery.MyApp());

    await tester.pump();

    // wait for splash screen to finish running
    Future.delayed(const Duration(milliseconds: 5000), () async {
      await tester.pump();

      // confirm home screen is opened
      final floatingButton =
          find.byKey(const ValueKey('floating_action_button'));
      expect(floatingButton, findsOneWidget);

      await tester.tap(floatingButton);

      final scaffold =
          find.byKey(const ValueKey('set_dinning_preference_scaffold'));
      expect(scaffold, findsOneWidget);

      await tester.pump();

      final changeLocation = find.byKey(const ValueKey('change_location_tap'));
      expect(changeLocation, findsOneWidget);

      await tester.tap(changeLocation);
      await tester.pump();
    });
  });
}
