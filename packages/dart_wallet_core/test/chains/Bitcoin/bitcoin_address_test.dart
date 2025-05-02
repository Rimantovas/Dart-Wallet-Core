import 'dart:typed_data';

import 'package:dart_wallet_core/dart_wallet_core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils.dart';

void main() {
  initTest();

  const testPubKey1 =
      "039d645d2ce630c2a9a6dbe0cbd0a8fcb7b70241cb8a48424f25593290af2494b9";
  const testP2phkAddr1 = "12dNaXQtN5Asn2YFwT1cvciCrJa525fAe4";
  const testP2phkData1 = "0011d91ce1cc681f95583da3f4a6841c174be950c7";
  const testP2shAddr1 = "3PQ5BD39rDikf7YW6pJ9a9tbS3QhvwvzTG";
  const testP2shData1 = "05ee1e69460b59027d9df0a79ca2c92aa382a25fb7";

  const coin = CoinType.Bitcoin;

  group('BitcoinAddress', () {
    test('P2PKH_CreateFromString', () {
      final address = BitcoinAddress.createWithString(testP2phkAddr1);
      expect(address?.description, testP2phkAddr1);
      expectHex(address?.data ?? [], testP2phkData1);
    });

    test('P2PKH_CreateFromPubkey', () {
      final publicKey = PublicKey.createWithData(
        testPubKey1.hexToBytes(),
        PublicKeyType.Secp256k1,
      );

      if (publicKey == null) {
        throw Exception('Failed to create public key');
      }

      final address =
          BitcoinAddress.createWithPublicKey(publicKey, coin.p2pkhPrefix);
      expect(address?.description, testP2phkAddr1);
      expectHex(address?.data ?? [], testP2phkData1);
    });

    test('P2PKH_CreateFromData', () {
      final address = BitcoinAddress.createWithData(
        testP2phkData1.hexToBytes(),
      );
      expect(address?.description, testP2phkAddr1);
      expectHex(address?.data ?? [], testP2phkData1);
    });

    test('P2WPKH_Nested_P2SH', () {
      // P2SH address cannot be created directly from pubkey, script is built
      final publicKey = PublicKey.createWithData(
        testPubKey1.hexToBytes(),
        PublicKeyType.Secp256k1,
      );

      if (publicKey == null) {
        throw Exception('Failed to create public key');
      }

      final pubkeyHash = publicKey.bitcoinKeyHash;
      expectHex(pubkeyHash, '11d91ce1cc681f95583da3f4a6841c174be950c7');

      final script = BitcoinScript.buildPayToWitnessPubkeyHash(pubkeyHash);
      expectHex(script.data, '001411d91ce1cc681f95583da3f4a6841c174be950c7');

      final scriptHash = Hash.sha256RIPEMD(script.data);
      expectHex(scriptHash, 'ee1e69460b59027d9df0a79ca2c92aa382a25fb7');

      final addressData = Uint8List.fromList([coin.p2shPrefix, ...scriptHash]);
      expectHex(addressData, testP2shData1);

      final address = BitcoinAddress.createWithData(addressData);
      expect(address?.description, testP2shAddr1);
      expectHex(address?.data ?? [], testP2shData1);
    });

    test('P2SH_CreateFromData', () {
      final address = BitcoinAddress.createWithData(
        testP2shData1.hexToBytes(),
      );
      expect(address?.description, testP2shAddr1);
      expectHex(address?.data ?? [], testP2shData1);
    });
  });
}
