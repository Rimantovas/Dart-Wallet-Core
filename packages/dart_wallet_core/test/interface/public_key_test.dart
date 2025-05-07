import 'package:dart_wallet_core/dart_wallet_core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils.dart';

const compressedSize = 33;
const uncompressedSize = 65;

void main() {
  initTest();

  group('PublicKey', () {
    test('Create', () {
      const publickKeyHex =
          '0399c6f51ad6f98c9c583f8e92bb7758ab2ca9a04110c0a1126ec43e5453d196c1';
      final publickKey = PublicKey.createWithData(
        publickKeyHex.hexToBytes(),
        PublicKeyType.Secp256k1,
      );
      expect(publickKey, isNotNull);
      final publicKeyData = publickKey?.data;
      expectHex(publicKeyData, publickKeyHex);
    });

    test('Create from private Secp256k1', () {
      final key =
          'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5';
      final privateKey = PrivateKey.createWithData(key.hexToBytes());

      if (privateKey == null) {
        throw Exception('Failed to create private key');
      }

      final publickKey = privateKey.getPublicKeySecp256k1(true);

      expect(publickKey.data.length, compressedSize);
      expectHex(publickKey.data,
          '0399c6f51ad6f98c9c583f8e92bb7758ab2ca9a04110c0a1126ec43e5453d196c1');
      expect(publickKey.description,
          '0399c6f51ad6f98c9c583f8e92bb7758ab2ca9a04110c0a1126ec43e5453d196c1');
      expect(PublicKey.isValid(publickKey.data, PublicKeyType.Secp256k1), true);
      expect(publickKey.isCompressed, true);
    });

    test('Create invalid', () {
      final publicKey = PublicKey.createWithData(
        'deadbeef'.hexToBytes(),
        PublicKeyType.Secp256k1,
      );
      expect(publicKey, isNull);
    });

    test('Compressed extended', () {
      final key =
          'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5';
      final privateKey = PrivateKey.createWithData(key.hexToBytes());

      if (privateKey == null) {
        throw Exception('Failed to create private key');
      }

      final publickKey = privateKey.getPublicKeySecp256k1(true);
      expect(publickKey.keyType, PublicKeyType.Secp256k1);
      expect(publickKey.data.length, compressedSize);
      expect(publickKey.isCompressed, true);
      expect(PublicKey.isValid(publickKey.data, PublicKeyType.Secp256k1), true);

      final extended = publickKey.uncompressed;
      expect(extended.keyType, PublicKeyType.Secp256k1extended);
      expect(extended.data.length, uncompressedSize);
      expect(extended.isCompressed, false);
      expect(PublicKey.isValid(extended.data, PublicKeyType.Secp256k1extended),
          true);

      final compressed = privateKey.getPublicKeySecp256k1(true);
      expect(compressed.keyType, PublicKeyType.Secp256k1);
      expect(compressed.data.length, compressedSize);
      expect(compressed.isCompressed, true);
      expect(PublicKey.isValid(compressed.data, PublicKeyType.Secp256k1), true);
    });

    test('Verify', () {
      final key =
          'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5';
      final privateKey = PrivateKey.createWithData(key.hexToBytes());

      const message = 'Hello';
      final messageData = message.stringToBytes;
      final digest = Hash.keccak256(messageData);

      final signature = privateKey?.signAsDer(digest);

      if (signature == null) {
        throw Exception('Failed to sign');
      }

      final publicKey = privateKey?.getPublicKeySecp256k1(false);

      expect(publicKey?.verifyAsDER(signature, digest), true);
      expect(publicKey?.verify(signature, digest), false);
    });

    test('Verify Ed25519', () {
      final key =
          'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5';
      final privateKey = PrivateKey.createWithData(key.hexToBytes());

      const message = 'Hello';
      final messageData = message.stringToBytes;
      final digest = Hash.sha256(messageData);

      final signature = privateKey?.sign(digest, Curve.Ed25519);

      if (signature == null) {
        throw Exception('Failed to sign');
      }

      final publicKey = privateKey?.getPublicKeyEd25519();

      final signature2 = privateKey?.sign(digest, Curve.Ed25519blake2bnano);

      if (signature2 == null) {
        throw Exception('Failed to sign');
      }

      final publicKey2 = privateKey?.getPublicKeyEd25519Blake2b();

      expect(publicKey?.verify(signature, digest), true);
      expect(publicKey2?.verify(signature2, digest), true);
    });

    test('Recover', () {
      final message =
          'de4e9524586d6fce45667f9ff12f661e79870c4105fa0fb58af976619bb11432';
      final signature =
          '00000000000000000000000000000000000000000000000000000000000000020123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef80';
      final publickKey =
          PublicKey.recover(signature.hexToBytes(), message.hexToBytes());
      expect(publickKey != null, true);
      expect(publickKey?.keyType, PublicKeyType.Secp256k1extended);
      final publicKeyData = publickKey?.data;
      expect(publicKeyData?.hexString,
          '0456d8089137b1fd0d890f8c7d4a04d0fd4520a30b19518ee87bd168ea12ed8090329274c4c6c0d9df04515776f2741eeffc30235d596065d718c3973e19711ad0');
    });

    test('Recover invalid', () {
      final deadbeef = 'deadbeef';
      expect(
          PublicKey.recover(deadbeef.hexToBytes(), deadbeef.hexToBytes()) ==
              null,
          true);
    });
  });
}
