import 'dart:typed_data';

import 'package:dart_wallet_core_codegen/generated/generated.dart';

extension BitcoinPublicKeyExtension on PublicKey {
  /// Returns the ripemd160 hash of the sha256 hash of the compressed public key data.
  Uint8List get bitcoinKeyHash {
    return Hash.sha256RIPEMD(compressed.data);
  }
}
