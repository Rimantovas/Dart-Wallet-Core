import 'dart:ffi';
import 'dart:io';

import 'package:dart_wallet_core_codegen/bindings/bindings.dart';

class WalletCore {
  final WCB _wcb;

  static String? testLibraryPath;

  // Private constructor
  WalletCore._privateConstructor(DynamicLibrary lib) : _wcb = WCB(lib);

  static DynamicLibrary _open() {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      final path =
          testLibraryPath ?? 'test/assets/libTrustWalletCore_arm64.dylib';
      print('Loading library from: $path');
      final lib = DynamicLibrary.open(path);
      return lib;
    } else {
      return Platform.isAndroid
          ? DynamicLibrary.open("libTrustWalletCore.so")
          : DynamicLibrary.process();
    }
  }

  // Static instance
  static WalletCore? _instance;

  // Static method to initialize the instance
  static void init({String? libraryPath}) {
    testLibraryPath = libraryPath;
    _instance ??= WalletCore._privateConstructor(_open());
  }

  // Static getter for WCB
  static WCB get wcb {
    if (_instance == null) {
      throw Exception('You must call WalletCore.init() before using it.');
    }
    return _instance!._wcb;
  }
}
