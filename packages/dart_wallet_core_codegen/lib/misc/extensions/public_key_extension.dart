import 'dart:typed_data';

import 'package:dart_wallet_core_codegen/generated/generated.dart';

typedef Hasher = Uint8List Function(Uint8List data);

extension BitcoinPublicKeyExtension on PublicKey {
  /// Returns the ripemd160 hash of the sha256 hash of the compressed public key data.
  Uint8List get bitcoinKeyHash {
    return Hash.sha256RIPEMD(compressed.data);
  }

  Uint8List hash(
    Uint8List prefix, {
    Hasher hasher = Hash.sha256RIPEMD,
    bool skipTypeByte = false,
  }) {
    final hashData = data.toList();
    if (skipTypeByte) {
      data.removeAt(0);
    }
    final hash = hasher(Uint8List.fromList(hashData));

    return Uint8List.fromList([...prefix, ...hash]);
  }
}
