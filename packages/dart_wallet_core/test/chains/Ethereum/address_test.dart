import 'package:dart_wallet_core/dart_wallet_core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('EthereumAddress', () {
    const coin = CoinType.Ethereum;

    test('Invalid', () {
      expect(AnyAddress.isValid('abc', coin), false);
      expect(
        AnyAddress.isValid('aaeb60f3e94c9b9a09f33669435e7ef1beaed', coin),
        false,
      );
      expect(
        AnyAddress.isValid('fB6916095ca1df60bB79Ce92cE3Ea74c37c5d359', coin),
        false,
      );
    });

    test('String', () {
      expect(
        AnyAddress.createWithString(
          '0x5aaeb6053f3e94c9b9a09f33669435e7ef1beaed',
          coin,
        )?.description,
        '0x5aAeb6053F3E94C9b9A09f33669435E7Ef1BeAed',
      );
    });

    test('FromPrivateKey', () {
      final privateKey = PrivateKey.createWithData(
          'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5'
              .hexToBytes());
      final publicKey =
          privateKey?.getPublicKeyByType(PublicKeyType.Secp256k1extended);
      final address = AnyAddress.createWithPublicKey(publicKey!, coin);

      expect(address.description, '0xAc1ec44E4f0ca7D172B7803f6836De87Fb72b309');

      final publicKey2 = privateKey?.getPublicKeyByType(PublicKeyType.Ed25519);
      final address2 = AnyAddress.createWithPublicKey(publicKey2!, coin);
      expect(address2.description, '');
    });

    test('IsValid', () {
      expect(AnyAddress.isValid('abc', coin), false);
      expect(
        AnyAddress.isValid('0x5aAeb6053F3E94C9b9A09f33669435E7Ef1BeAed', coin),
        true,
      );
    });
  });
}
