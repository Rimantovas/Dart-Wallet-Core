import 'package:dart_wallet_core/dart_wallet_core.dart';
import 'package:dart_wallet_core_example/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Create Wallet Test', (WidgetTester tester) async {
    // Initialize the app
    app.main();
    await tester.pumpAndSettle();

    // Wait for initialization
    await tester.pump(const Duration(seconds: 3));

    // Find widgets to interact with
    final createWalletButton = find.byKey(const Key('create_wallet_button'));
    expect(createWalletButton, findsOneWidget,
        reason: 'Create Wallet button not found');

    // Tap the Create Wallet button
    await tester.tap(createWalletButton);
    await tester.pumpAndSettle();

    // Wait for the test to complete
    await tester.pump(const Duration(seconds: 2));

    // Verify the result is displayed
    final resultText = find.text('TESTING true');
    expect(resultText, findsOneWidget,
        reason: 'Test result not found or test failed');

    // Verify the mnemonic is generated
    final resultCard = find.byType(Card).last;
    final mnemonicTextFinder = find.descendant(
      of: resultCard,
      matching: find.textContaining('Generated mnemonic:'),
    );

    expect(mnemonicTextFinder, findsOneWidget,
        reason: 'Mnemonic not displayed');

    // Verify the mnemonic is valid
    final mnemonicText = tester.widget<Text>(mnemonicTextFinder).data!;
    final mnemonic = mnemonicText.replaceFirst('Generated mnemonic: ', '');
    expect(Mnemonic.isValid(mnemonic), isTrue,
        reason: 'Generated mnemonic is not valid');
  });
}
