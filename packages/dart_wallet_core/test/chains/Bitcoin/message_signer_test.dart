import 'dart:typed_data';

import 'package:dart_wallet_core/dart_wallet_core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils.dart';

void main() {
  initTest();

  group('BitcoinMessageSigner', () {
    test('VerifyMessage', () {
      expect(
        BitcoinMessageSigner.verifyMessage(
          '1B8Qea79tsxmn4dTiKKRVvsJpHwL2fMQnr',
          'test signature',
          'H+3L5IbSVcejp4S2VwLXCxLEMQAWDvKbE8lQyq0ocdvyM1aoEudkzN/S/qLI3vnNOFY6V13BXWSFrPr3OjGa5Dk=',
        ),
        true,
      );
      expect(
        BitcoinMessageSigner.verifyMessage(
          '1HZwkjkeaoZfTSaJxDw6aKkxp45agDiEzN',
          'This is an example of a signed message.',
          'G39Qf0XrZHICWbz3r5gOkcgTRw3vM4leGjiR3refr/K1OezcKmmXaLn4zc8ji2rjbBUIMrIhH/jc5Z2qEEz7qVk=',
        ),
        true,
      );
      expect(
        BitcoinMessageSigner.verifyMessage(
          '1H8X4u6CVZRTLLNbUQTKAnc5vCkqWMpwfF',
          'compressed key',
          'IKUI9v2xbHogJe8HKXI2M5KEhMKaW6fjNxtyEy27Mf+3/e1ht4jZoc85e4F8stPsxt4Xcg8Yr42S28O6L/Qx9fE=',
        ),
        true,
      );
      expect(
        BitcoinMessageSigner.verifyMessage(
          '19cAJn4Ms8jodBBGtroBNNpCZiHAWGAq7X',
          'test signature',
          'ILH5K7JQLaRGaKGXXH5mYM6FIIy9IWyY4JUPI+PHYY4WaupxUbg+zy0bhBCrDuehy9x4WidwjkRR1GSLnWvOXBo=',
        ),
        true,
      );
      expect(
        BitcoinMessageSigner.verifyMessage(
          '19cAJn4Ms8jodBBGtroBNNpCZiHAWGAq7X',
          'another text',
          'H7vrF2C+TlFiHyegAw3QLv6SK0myuEEXUOgfx0+Qio1YVDuSa6p/OHpoQVlUt3F8QJdbdZN9M1h/fYEAnEz16V0=',
        ),
        true,
      );
      expect(
        BitcoinMessageSigner.verifyMessage(
          '1E4T9JZ3mq6cdgiRJEWzHqDXb9t322fE6d',
          'test signature',
          'HLH5K7JQLaRGaKGXXH5mYM6FIIy9IWyY4JUPI+PHYY4WaupxUbg+zy0bhBCrDuehy9x4WidwjkRR1GSLnWvOXBo=',
        ),
        true,
      );
    });

    test('SignAndVerify', () {
      final gPrivateKey = PrivateKey.createWithData(
          'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5'
              .hexToBytes());

      if (gPrivateKey == null) {
        throw Exception('Failed to create private key');
      }
      final pubkey = gPrivateKey.getPublicKeyByType(PublicKeyType.Secp256k1);
      expectHex(pubkey.data,
          '0399c6f51ad6f98c9c583f8e92bb7758ab2ca9a04110c0a1126ec43e5453d196c1');
      final address = BitcoinAddress.createWithPublicKey(
          pubkey, CoinType.Bitcoin.p2pkhPrefix);

      if (address == null) {
        throw Exception('Failed to create address');
      }

      expect(address.description, '19cAJn4Ms8jodBBGtroBNNpCZiHAWGAq7X');

      {
        const msg = 'test signature';
        final signature = BitcoinMessageSigner.signMessage(
          gPrivateKey,
          address.description,
          msg,
        );

        expect(signature,
            'ILH5K7JQLaRGaKGXXH5mYM6FIIy9IWyY4JUPI+PHYY4WaupxUbg+zy0bhBCrDuehy9x4WidwjkRR1GSLnWvOXBo=');
      }

      {
        const msg = 'another text';
        final signature = BitcoinMessageSigner.signMessage(
          gPrivateKey,
          address.description,
          msg,
        );

        expect(signature,
            'H7vrF2C+TlFiHyegAw3QLv6SK0myuEEXUOgfx0+Qio1YVDuSa6p/OHpoQVlUt3F8QJdbdZN9M1h/fYEAnEz16V0=');
      }

      // uncompressed
      final pubKeyUncomp =
          gPrivateKey.getPublicKeyByType(PublicKeyType.Secp256k1extended);
      final keyHash = pubKeyUncomp.hash(
        Uint8List.fromList([CoinType.Bitcoin.p2pkhPrefix]),
        hasher: Hash.sha256RIPEMD,
      );
      final addressUncomp = BitcoinAddress.createWithData(keyHash);
      expect(addressUncomp?.description, '1E4T9JZ3mq6cdgiRJEWzHqDXb9t322fE6d');

      // {
      //   const msg = 'test signature';
      //   final signature = BitcoinMessageSigner.signMessage(
      //      gPrivateKey,
      //     addressUncomp.description,
      //      msg,
      //     compressed: false,
      //   );

      //   expect(signature,
      //       'HLH5K7JQLaRGaKGXXH5mYM6FIIy9IWyY4JUPI+PHYY4WaupxUbg+zy0bhBCrDuehy9x4WidwjkRR1GSLnWvOXBo=');
      // }
    });

    test('SignAndVerify', () {
      const privKeyData =
          'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5';
      final privateKey = PrivateKey.createWithData(privKeyData.hexToBytes());
      const address = '19cAJn4Ms8jodBBGtroBNNpCZiHAWGAq7X';
      const message = 'test signature';

      if (privateKey == null) {
        throw Exception('Failed to create private key');
      }

      final signature = BitcoinMessageSigner.signMessage(
        privateKey,
        address,
        message,
      );
      expect(signature,
          'ILH5K7JQLaRGaKGXXH5mYM6FIIy9IWyY4JUPI+PHYY4WaupxUbg+zy0bhBCrDuehy9x4WidwjkRR1GSLnWvOXBo=');

      expect(
        BitcoinMessageSigner.verifyMessage(
          address,
          message,
          signature,
        ),
        true,
      );
    });
  });
}
