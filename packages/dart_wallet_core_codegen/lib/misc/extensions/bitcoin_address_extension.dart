import 'dart:typed_data';

import 'package:dart_wallet_core_codegen/src/generated/generated.dart';

extension XBitcoinAddress on BitcoinAddress {
  Uint8List get data => Uint8List.fromList([prefix, ...keyhash]);
}
