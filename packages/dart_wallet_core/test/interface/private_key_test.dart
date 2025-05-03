import 'package:dart_wallet_core/dart_wallet_core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils.dart';

const key1Hex =
    "22667b69166481c9f334756f49c8dddfd72c6bcdd68a7386886e97a82f741130";

void main() {
  initTest();

  group('PrivateKey', () {
    test('Create', () {
      final privateKey = PrivateKey.createWithData(key1Hex.hexToBytes());
      expect(privateKey, isNotNull);

      if (privateKey == null) {
        throw Exception('Failed to create private key');
      }

      final data = privateKey.data;
      expect(data.hexString, key1Hex);
    });

    test('Create invalid', () {
      final privateKey = PrivateKey.createWithData('deadbeef'.hexToBytes());
      expect(privateKey, isNull);
    });

    test('Create copy', () {
      final privateKey1 = PrivateKey.createWithData(key1Hex.hexToBytes());
      expect(privateKey1, isNotNull);

      if (privateKey1 == null) {
        throw Exception('Failed to create private key');
      }

      final privateKey2 = PrivateKey.createCopy(privateKey1);
      expect(privateKey2, isNotNull);
    });

    test('Invalid', () {
      final bytes =
          'fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141'
              .hexToBytes();
      final valid = PrivateKey.isValid(bytes, Curve.Secp256k1);

      final bytes2 =
          '0000000000000000000000000000000000000000000000000000000000000000'
              .hexToBytes();
      final valid2 = PrivateKey.isValid(bytes2, Curve.Secp256k1);

      expect(valid, false);
      expect(valid2, false);
    });

    test('IsValid', () {
      final key =
          'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5';

      final bytes = key.hexToBytes();

      expect(PrivateKey.isValid(bytes, Curve.Secp256k1), true);
      expect(PrivateKey.isValid(bytes, Curve.Ed25519), true);
    });

    test('PublicKey', () {
      final privateKey = PrivateKey.createWithData(
          'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5'
              .hexToBytes());

      if (privateKey == null) {
        throw Exception('Failed to create private key');
      }

      {
        final publickKey = privateKey.getPublicKeySecp256k1(false);
        expect(publickKey.data.hexString,
            '0499c6f51ad6f98c9c583f8e92bb7758ab2ca9a04110c0a1126ec43e5453d196c166b489a4b7c491e7688e6ebea3a71fc3a1a48d60f98d5ce84c93b65e423fde91');
      }
      {
        final publickKey = privateKey.getPublicKeyNist256p1();
        expect(publickKey.data.hexString,
            '026d786ab8fda678cf50f71d13641049a393b325063b8c0d4e5070de48a2caf9ab');
      }
      {
        final publickKey = privateKey.getPublicKeyCurve25519();
        expect(publickKey.data.hexString,
            '686cfce9108566dd43fc6aa75e31f9a9f319c9e9c04d6ad0a52505b86bc17c3a');
      }
      {
        final publickKey = privateKey.getPublicKey(CoinType.Ethereum);
        expect(publickKey.data.hexString,
            '0499c6f51ad6f98c9c583f8e92bb7758ab2ca9a04110c0a1126ec43e5453d196c166b489a4b7c491e7688e6ebea3a71fc3a1a48d60f98d5ce84c93b65e423fde91');

        final publicKeyByType =
            privateKey.getPublicKeyByType(CoinType.Ethereum.publicKeyType);

        expect(publickKey.data.hexString, publicKeyByType.data.hexString);
      }
      {
        final publickKey = privateKey.getPublicKey(CoinType.Neo);
        expect(publickKey.data.hexString,
            '026d786ab8fda678cf50f71d13641049a393b325063b8c0d4e5070de48a2caf9ab');
      }
      {
        final publickKey = privateKey.getPublicKey(CoinType.Waves);
        expect(publickKey.data.hexString,
            '686cfce9108566dd43fc6aa75e31f9a9f319c9e9c04d6ad0a52505b86bc17c3a');
      }
    });

    test('Sign', () {
      final privateKey = PrivateKey.createWithData(
          'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5'
              .hexToBytes());

      const message = 'hello';
      final data = message.stringToBytes;
      final hash = Hash.keccak256(data);

      final actual = privateKey?.sign(hash, Curve.Secp256k1);

      expect(actual?.hexString,
          '8720a46b5b3963790d94bcc61ad57ca02fd153584315bfa161ed3455e336ba624d68df010ed934b8792c5b6a57ba86c3da31d039f9612b44d1bf054132254de901');
    });

    test('SignAsDER', () {
      final privateKey = PrivateKey.createWithData(
          'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5'
              .hexToBytes());

      const message = 'hello';
      final data = message.stringToBytes;
      final hash = Hash.keccak256(data);

      final actual = privateKey?.signAsDer(hash);

      expect(actual?.hexString,
          '30450221008720a46b5b3963790d94bcc61ad57ca02fd153584315bfa161ed3455e336ba6202204d68df010ed934b8792c5b6a57ba86c3da31d039f9612b44d1bf054132254de9');
    });
  });
}
