part of 'generated.dart';
extension BitcoinSigHashTypeExtension on BitcoinSigHashType {
bool isSingle() {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWBitcoinSigHashTypeIsSingle(obj);
    deferManager.runDeferredActions();
    return result;
}

bool isNone() {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWBitcoinSigHashTypeIsNone(obj);
    deferManager.runDeferredActions();
    return result;
}
}
