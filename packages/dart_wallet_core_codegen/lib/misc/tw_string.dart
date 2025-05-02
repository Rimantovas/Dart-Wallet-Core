// Converts a String to Pointer<Utf8>, caller must free it after use.
// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:dart_wallet_core_codegen/core.dart';
import 'package:ffi/ffi.dart';

// Converts a String to Pointer<Int8>, caller must free it after use.
Pointer<Void> TWStringCreateWithNSString(String string) {
  final Pointer<Char> charPointer = string.toNativeUtf8().cast<Char>();
  final Pointer<Void> result =
      WalletCore.wcb.TWStringCreateWithUTF8Bytes(charPointer);
  calloc.free(charPointer.cast<Utf8>());
  return result;
}

// Converts a Pointer<Int8> (will be freed within this call) to a String.
String TWStringNSString(Pointer<Void> string) {
  final Pointer<Char> charPointer =
      WalletCore.wcb.TWStringUTF8Bytes(string.cast());
  final String result = charPointer.cast<Utf8>().toDartString();
  WalletCore.wcb.TWStringDelete(string);
  return result;
}
