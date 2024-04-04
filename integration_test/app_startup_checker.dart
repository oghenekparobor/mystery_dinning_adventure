import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mystery_dinning_adventure/main.dart' as mystery;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('check to see the mystery app start and select category', (widgetTester) async {
    // start up the mystery dinning app
    await mystery.main();

    // confirm home screen is opened
    final floatingButton = find.byKey(const ValueKey('floating_action_button'));
    expect(floatingButton, findsOneWidget);


  });
}
