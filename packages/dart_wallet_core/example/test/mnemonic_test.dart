import 'dart:io';

import 'package:dart_wallet_core/dart_wallet_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as path;

void main() {
  setUp(() {
    final scriptDir = Directory.current.path;
    final dyLibPath = path.join(
        scriptDir, 'test', 'assets', 'libTrustWalletCore_arm64.dylib');

    WalletCore.init(libraryPath: dyLibPath);
  });

  test('test isValid', () {
    final mnemonic =
        "llanto radical atraer riesgo actuar masa fondo cielo dieta archivo sonrisa mamut";

    final wallet = HDWallet.createWithMnemonicCheck(mnemonic, '', false);
    final address = wallet?.getAddressForCoin(CoinType.Ethereum);
    expect(address, '0xa4531dE99E22B2166d340E7221669DF565c52024');
  });
}
