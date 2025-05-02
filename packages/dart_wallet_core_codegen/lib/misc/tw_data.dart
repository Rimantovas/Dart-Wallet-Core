import 'dart:ffi';
import 'dart:typed_data';

import 'package:dart_wallet_core_codegen/core.dart';
import 'package:dart_wallet_core_utils/dart_wallet_core_utils.dart';

Pointer<Void> TWDataCreateWithNSData(Uint8List data) {
  return WalletCore.wcb
      .TWDataCreateWithBytes(data.toPointerUint8(), data.length);
}

Uint8List TWDataNSData(Pointer<Void> data) {
  final Uint8List result = WalletCore.wcb
      .TWDataBytes(data)
      .asTypedList(WalletCore.wcb.TWDataSize(data));
  // WalletCore.wcb.TWDataDelete(data.cast());
  return result;
}
