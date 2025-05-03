import 'package:dart_wallet_core_example/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Ethereum Transaction Integration Test', () {
    testWidgets('Verify Ethereum transaction signing works correctly',
        (WidgetTester tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Wait for initialization
      await tester.pump(const Duration(seconds: 3));

      // Find and tap the test button
      final Finder testButton = find.byKey(const Key('ethereum_test_button'));

      // Print to debug what widgets are available
      print(
          'Available widgets: ${find.byType(ElevatedButton).evaluate().length}');
      print(
          'All widgets: ${find.byWidgetPredicate((widget) => true).evaluate().length}');

      // Wait for the button to be enabled (the wallet core initialization may take time)
      await tester.pump(const Duration(seconds: 1));

      expect(testButton, findsOneWidget, reason: 'Test button not found');

      await tester.tap(testButton);
      await tester.pumpAndSettle();

      // Verify that output is displayed on screen
      expect(find.text('TESTING true'), findsOneWidget,
          reason: 'Text showing successful test should be displayed');
    });
  });
}
