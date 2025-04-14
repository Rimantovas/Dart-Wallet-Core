part of 'generated.dart';

class TransactionCompiler {
  TransactionCompiler();

  static Uint8List preImageHashes(CoinType coinType, Uint8List txInputData) {
    final deferManager = DeferManager();
    var coinType0 = coinType.value;
    var txInputData0 = TWDataCreateWithNSData(txInputData);
    deferManager.defer(() {
      WalletCore.wcb.TWDataDelete(txInputData0);
    });
    var result = WalletCore.wcb
        .TWTransactionCompilerPreImageHashes(coinType0, txInputData0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
  }

  static Uint8List compileWithSignatures(CoinType coinType,
      Uint8List txInputData, DataVector signatures, DataVector publicKeys) {
    final deferManager = DeferManager();
    var coinType0 = coinType.value;
    var txInputData0 = TWDataCreateWithNSData(txInputData);
    deferManager.defer(() {
      WalletCore.wcb.TWDataDelete(txInputData0);
    });
    var signatures0 = signatures.rawValue;
    var publicKeys0 = publicKeys.rawValue;
    var result = WalletCore.wcb.TWTransactionCompilerCompileWithSignatures(
        coinType0, txInputData0, signatures0, publicKeys0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
  }
}
