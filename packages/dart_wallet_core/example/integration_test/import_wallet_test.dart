import 'package:dart_wallet_core_example/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Import Wallet Test', (WidgetTester tester) async {
    // Initialize the app
    app.main();
    await tester.pumpAndSettle();

    // Wait for initialization
    await tester.pump(const Duration(seconds: 3));

    // Find widgets to interact with
    final importWalletButton = find.byKey(const Key('import_wallet_button'));
    expect(importWalletButton, findsOneWidget,
        reason: 'Import Wallet button not found');

    // Tap the Import Wallet button
    await tester.tap(importWalletButton);
    await tester.pumpAndSettle();

    // Wait for the test to complete
    await tester.pump(const Duration(seconds: 2));

    // Verify the result is displayed
    final resultText = find.text('TESTING true');
    expect(resultText, findsOneWidget,
        reason: 'Test result not found or test failed');

    // Verify the expected mnemonic is displayed in the result
    final expectedMnemonic =
        "ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal";
    final resultCard = find.byType(Card).last;
    final mnemonicTextFinder = find.descendant(
      of: resultCard,
      matching: find.textContaining('Mnemonic: $expectedMnemonic'),
    );

    expect(mnemonicTextFinder, findsOneWidget,
        reason: 'Expected mnemonic not found in results');

    // Verify seed and entropy matches
    final seedMatchesTextFinder = find.descendant(
      of: resultCard,
      matching: find.textContaining('Seed matches: true'),
    );
    final entropyMatchesTextFinder = find.descendant(
      of: resultCard,
      matching: find.textContaining('Entropy matches: true'),
    );

    expect(seedMatchesTextFinder, findsOneWidget,
        reason: 'Seed match verification failed');
    expect(entropyMatchesTextFinder, findsOneWidget,
        reason: 'Entropy match verification failed');
  });
}
