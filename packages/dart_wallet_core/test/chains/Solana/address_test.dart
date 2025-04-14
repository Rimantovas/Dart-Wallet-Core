import 'package:dart_wallet_core/dart_wallet_core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils.dart';

void main() {
  initTest();

  group('SolanaAddress', () {
    const coin = CoinType.Solana;

    test('FromPublicKey', () {
      {
        const addressString = "2gVkYWexTHR5Hb2aLeQN3tnngvWzisFKXDUPrgMHpdST";
        final publicKey = PublicKey.createWithData(
          Base58.decodeNoCheck(addressString)!,
          PublicKeyType.Ed25519,
        );
        final address = AnyAddress.createWithPublicKey(publicKey!, coin);
        expect(addressString, address.description);
      }
      {
        final privateKey = PrivateKey.createWithData(
            'a1269039e4ffdf43687852d7247a295f0b5bc55e6dda031cffaa3295ca0a9d7a'
                .hexToBytes());
        final publicKey = privateKey?.getPublicKeySecp256k1(false);
        expect(
          AnyAddress.createWithPublicKey(publicKey!, coin).description.isEmpty,
          true,
        );
      }
    });

    test('FromData', () {
      {
        final address = AnyAddress.createWithPublicKey(
          PublicKey.createWithData(
            '18f9d8d877393bbbe8d697a8a2e52879cc7e84f467656d1cce6bab5a8d2637ec'
                .hexToBytes(),
            PublicKeyType.Ed25519,
          )!,
          coin,
        );
        expect(address.description,
            '2gVkYWexTHR5Hb2aLeQN3tnngvWzisFKXDUPrgMHpdST');
      }
    });

    test('FromString', () {
      const addressString = "2gVkYWexTHR5Hb2aLeQN3tnngvWzisFKXDUPrgMHpdST";
      final address = AnyAddress.createWithString(addressString, coin);
      expect(address?.description, addressString);
    });

    test('isValid', () {
      expect(
        AnyAddress.isValid(
            '2gVkYWexTHR5Hb2aLeQN3tnngvWzisFKXDUPrgMHpdST', coin),
        true,
      );
      expect(
        AnyAddress.isValid(
            '2gVkYWexTHR5Hb2aLeQN3tnngvWzisFKXDUPrgMHpdSl', coin),
        false,
      ); // Contains invalid base-58 character
      expect(
        AnyAddress.isValid('2gVkYWexTHR5Hb2aLeQN3tnngvWzisFKXDUPrgMHpd', coin),
        false,
      ); // Is invalid length
    });

    test('isValidOnCurve', () {
      expect(
        PublicKey.isValid(
          Base58.decodeNoCheck('HzqnaMjWFbK2io6WgV2Z5uBguCBU21RMUS16wsDUHkon')!,
          PublicKeyType.Ed25519,
        ),
        true,
      );

      expect(
        PublicKey.isValid(
          Base58.decodeNoCheck('68io7dTfyeWua1wD1YcCMka4y5iiChceaFRCBjqCM5PK')!,
          PublicKeyType.Ed25519,
        ),
        true,
      );
      expect(
        PublicKey.isValid(
          Base58.decodeNoCheck('Dra34QLFCjxnk8tUNcBwxs6pgb5spF4oseQYF2xn7ABZ')!,
          PublicKeyType.Ed25519,
        ),
        true,
      );
    });
  });
}
