import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:dart_wallet_core/dart_wallet_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as path;

void initTest() {
  setUpAll(() async {
    final scriptDir = Directory.current.path;
    final dyLibPath = path.join(
        scriptDir, 'test', 'assets', 'libTrustWalletCore_arm64.dylib');

    WalletCore.init(libraryPath: dyLibPath);
  });
}

void expectHex(List<int> actual, String expected) {
  expect(Uint8List.fromList(actual).hexString, expected.replaceFirst('0x', ''));
}

void expectHexBytes(List<int> actual, List<int> expected) {
  expect(HexUtils.getString(Uint8List.fromList(actual)),
      HexUtils.getString(Uint8List.fromList(expected)));
}

void expectJson(String actual, String expected) {
  expect(
    const DeepCollectionEquality()
        .equals(json.decode(actual), json.decode(expected)),
    true,
  );
}

void expectException(void Function() fn) {
  expect(fn, throwsException);
}
