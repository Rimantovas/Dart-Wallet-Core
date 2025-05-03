import 'dart:typed_data';

import 'package:dart_wallet_core_codegen/core.dart';
import 'package:dart_wallet_core_codegen/misc/misc.dart';
import 'package:dart_wallet_core_codegen/src/generated/generated.dart';
import 'package:protobuf/protobuf.dart';

typedef Formatter<T> = T Function(Uint8List bytes);

class AnySigner {
  // Signs a transaction by SigningInput message and coin type
  static T sign<T>(
      GeneratedMessage input, CoinType coin, Formatter<T> formatter) {
    var inputData = TWDataCreateWithNSData(input.writeToBuffer());

    final signer = WalletCore.wcb.TWAnySignerSign(inputData, coin.rawValue);
    final result = TWDataNSData(signer);
    WalletCore.wcb.TWDataDelete(inputData);
    return formatter(result);
  }

  static Uint8List nativeSign(Uint8List data, CoinType coin) {
    var inputData = TWDataCreateWithNSData(data);

    final signer = WalletCore.wcb.TWAnySignerSign(inputData, coin.rawValue);
    try {
      return TWDataNSData(signer);
    } finally {
      WalletCore.wcb.TWDataDelete(inputData);
    }
  }

  // Check if AnySigner supports signing JSON representation of SigningInput for a given coin
  static bool supportsJSON(CoinType coin) {
    return WalletCore.wcb.TWAnySignerSupportsJSON(coin.value);
  }

  // Signs a transaction specified by the JSON representation of a SigningInput, coin type, and a private key
  static String signJSON(String json, Uint8List key, CoinType coin) {
    final deferManager = DeferManager();
    var jsonString = TWStringCreateWithNSString(json);
    var keyData = TWDataCreateWithNSData(key);
    deferManager.defer(() {
      WalletCore.wcb.TWDataDelete(keyData);
    });
    final result = TWStringNSString(
        WalletCore.wcb.TWAnySignerSignJSON(jsonString, keyData, coin.value));
    deferManager.runDeferredActions();
    return result;
  }

  // Plans a transaction (for UTXO chains only)
  static Uint8List plan(Uint8List input, CoinType coin) {
    try {
      return nativePlan(input, coin);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  // Plans a transaction (for UTXO chains only)
  static Uint8List nativePlan(Uint8List data, CoinType coin) {
    final deferManager = DeferManager();
    var inputData = TWDataCreateWithNSData(data);
    deferManager.defer(() {
      WalletCore.wcb.TWDataDelete(inputData);
    });
    final result =
        TWDataNSData(WalletCore.wcb.TWAnySignerPlan(inputData, coin.value));
    deferManager.runDeferredActions();
    return result;
  }
}
