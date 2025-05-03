import 'package:dart_wallet_core_example/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Derive Address Test', (WidgetTester tester) async {
    // Initialize the app
    app.main();
    await tester.pumpAndSettle();

    // Wait for initialization
    await tester.pump(const Duration(seconds: 3));

    // Find widgets to interact with
    final deriveAddressButton = find.byKey(const Key('derive_address_button'));
    expect(deriveAddressButton, findsOneWidget,
        reason: 'Derive Address button not found');

    // Tap the Derive Address button
    await tester.tap(deriveAddressButton);
    await tester.pumpAndSettle();

    // Wait for the test to complete
    await tester.pump(const Duration(seconds: 2));

    // Verify the result is displayed
    final resultText = find.text('TESTING true');
    expect(resultText, findsOneWidget,
        reason: 'Test result not found or test failed');

    // Verify the expected Bitcoin address is derived correctly
    final expectedBtcAddress = "bc1qumwjg8danv2vm29lp5swdux4r60ezptzz7ce85";
    final resultCard = find.byType(Card).last;
    final btcAddressTextFinder = find.descendant(
      of: resultCard,
      matching: find.textContaining('Bitcoin address: $expectedBtcAddress'),
    );

    expect(btcAddressTextFinder, findsOneWidget,
        reason: 'Expected Bitcoin address not found in results');

    // Verify the expected Ethereum address is derived correctly
    final expectedEthAddress = "0x27Ef5cDBe01777D62438AfFeb695e33fC2335979";
    final ethAddressTextFinder = find.descendant(
      of: resultCard,
      matching: find.textContaining('Ethereum address: $expectedEthAddress'),
    );

    expect(ethAddressTextFinder, findsOneWidget,
        reason: 'Expected Ethereum address not found in results');

    // Verify Bitcoin and Ethereum address matches
    final btcMatchesTextFinder = find.descendant(
      of: resultCard,
      matching: find.textContaining('Matches: true'),
    );

    expect(btcMatchesTextFinder, findsAtLeastNWidgets(2),
        reason: 'Address match verification failed');
  });
}
