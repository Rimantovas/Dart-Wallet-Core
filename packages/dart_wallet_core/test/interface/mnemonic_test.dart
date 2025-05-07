import 'package:dart_wallet_core/dart_wallet_core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils.dart';

void main() {
  initTest();

  group('Mnemonic', () {
    test('IsValid', () {
      expect(
          Mnemonic.isValid(
              'credit expect life fade cover suit response wash pear what skull force'),
          true);
      expect(
          Mnemonic.isValid(
              'ripple scissors hisc mammal hire column oak again sun offer wealth tomorrow'),
          false);
    });

    test('isValidWord', () {
      expect(Mnemonic.isValidWord('credit'), true);
      expect(Mnemonic.isValidWord('hybridous'), false);
    });

    test('suggest', () {
      expect(Mnemonic.suggest('air'), 'air airport');
      expect(Mnemonic.suggest('rob'), 'robot robust');
    });

    test('Spanish Mnemonic', () {
      final spanishMnemonic =
          'llanto radical atraer riesgo actuar masa fondo cielo dieta archivo sonrisa mamut';

      expect(Mnemonic.isValid(spanishMnemonic), false);

      final wallet =
          HDWallet.createWithMnemonicCheck(spanishMnemonic, '', false);

      if (wallet == null) {
        throw Exception('Failed to create wallet');
      }

      final btcXpub = wallet.getExtendedPublicKey(
          Purpose.Bip44, CoinType.Bitcoin, HDVersion.Xpub);
      final ethXpub = wallet.getExtendedPublicKey(
          Purpose.Bip44, CoinType.Ethereum, HDVersion.Xpub);

      expect(btcXpub,
          'xpub6Cq43Vqyvb2DwXzjzNeMpPuxXRCN1WnmRCmYLPaaSv2XZXM2yCwUHpWEyB3zQ3FGCQsvY21gecMaQR7b2zhhgiHnjzDYpKCE2LACueaSMuR');
      expect(ethXpub,
          'xpub6Bgma7boPVudhExmB97iySvatGfnXkfBxYZYNTFYJvVzigUPk1X2iE8VhJPPxVuzjH8wBuTqRBMKCbwMYQNLrFCwYzMugYw4RM5VGNeVDpp');

      final ethAddress = wallet.getAddressForCoin(CoinType.Ethereum);
      final btcAddress = wallet.getAddressForCoin(CoinType.Bitcoin);

      expect(ethAddress, '0xa4531dE99E22B2166d340E7221669DF565c52024');
      expect(btcAddress, 'bc1q97jc0jdgsyvvhxydxxd6np8sa920c39l3qpscf');
    });
  });
}
